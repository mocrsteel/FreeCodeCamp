#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
# Fully clean tables first to get sequence numbers to start at one every single time.
# echo "$(psql -U freecodecamp -d worldcup < up.sql)"

echo "$($PSQL "TRUNCATE TABLE teams RESTART IDENTITY CASCADE;")"
echo "$($PSQL "TRUNCATE TABLE games RESTART IDENTITY;"):"

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # omit header line
  if [[ $YEAR != 'year' ]]
  then
    # attempt to get winner id from db
    WINNER_ID="$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER';")"
    if [[ -z $WINNER_ID ]]
    then
      # Insert winner as not in table
      WINNER_INSERT="$($PSQL "
        INSERT INTO teams(name) VALUES ('$WINNER');
      ")"
      if [[ $WINNER_INSERT = 'INSERT 0 1' ]]
      then
        WINNER_ID="$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER';")"
        echo "Inserted winner $WINNER in the teams table with ID $WINNER_ID."
      fi
    fi
    
    # attemps to get opponent ID from table.
    OPPONENT_ID=$($PSQL "SELECT team_id from teams WHERE name = '$OPPONENT';")
    if [[ -z $OPPONENT_ID ]]
    then
      # Insert opponent as not in table
      OPPONENT_INSERT="$($PSQL "INSERT INTO teams(name) VALUES ('$OPPONENT');")"
      if [[ $OPPONENT_INSERT = 'INSERT 0 1' ]]
      then
        OPPONENT_ID=$($PSQL "SELECT team_id from teams WHERE name = '$OPPONENT';")
        echo "Inserted opponent $OPPONENT in the teams table with ID $OPPONENT_ID."
      fi
    fi

    # insert game data in data table
    GAME_INSERT="$($PSQL "
      INSERT INTO games (
        year, round, winner_id, opponent_id, winner_goals, opponent_goals
      )
      VALUES (
        $YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS
      );
    ")"
    if [[ $GAME_INSERT = 'INSERT 0 1' ]]
    then
      echo "Inserted $YEAR - $ROUND game: $WINNER - $OPPONENT into games."
    fi
  fi
done

echo "$($PSQL "SELECT * FROM teams;")"
echo "$($PSQL "SELECT * FROM games;")"