#!/bin/bash
PSQL="psql -U freecodecamp number_guess -t --tuples-only -c"
SECRET_NUMBER=$[$RANDOM % 1000 + 1]
GUESSES=1

# User handling
echo "Enter your username:"
read USERNAME
USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$USERNAME';")
if [[ -z $USER_ID ]]
then
  # add user to database
  INSERT_RESULT=$($PSQL "INSERT INTO users(name) VALUES ('$USERNAME');")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  # Now load user_id for later use
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$USERNAME';")
else
  USER_STATS=$($PSQL "SELECT count(game_id), min(tries) FROM games WHERE user_id = $USER_ID;")
  read GAME_COUNT DASH BEST_GAME <<< "$USER_STATS"
  if [[ $GAME_COUNT -eq 0 || -z $BEST_GAME ]]
  then
    echo "Welcome, $USERNAME! It looks like this is your first time here."
  else
    echo -e "\nWelcome back, $USERNAME! You have played $GAME_COUNT games, and your best game took $BEST_GAME guesses."
  fi
fi

# Game section
echo "Attemp: $GUESSES"
echo "Guess the secret number between 1 and 1000:"

while true
do
  read GUESS
  if [[ ! "$GUESS" =~ ^[0-9]+$ ]]
  then
    echo "Attemp: $GUESSES"
    echo "That is not an integer, guess again:"
  elif [[ $GUESS -ne $SECRET_NUMBER ]]
  then
    GUESSES=$(($GUESSES+1))
    if [[ $GUESS -lt $SECRET_NUMBER ]]
    then
      echo "Attemp: $GUESSES"
      echo "It's higher than that, guess again:"
    else
      echo "Attemp: $GUESSES"
      echo "It's lower than that, guess again:"
    fi
  else
    echo -e "\nYou guessed it in $GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!" 
    # save result in database
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, tries) VALUES ($USER_ID, $GUESSES);")
    break
  fi
done
