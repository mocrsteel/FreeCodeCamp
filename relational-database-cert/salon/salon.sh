#!/bin/bash
PSQL="psql -U freecodecamp salon -X --tuples-only -c"

echo -e "\n~~~~ MY SALON ~~~~~\n\nWelcome to my Salon. How can I help you?\n"

MAIN_MENU () {
  if [[ $1 ]] 
  then
    echo -e "\n$1\n"
  fi

  # print list of services
  echo "$($PSQL "SELECT * FROM services ORDER BY service_id;")" | while read ID BAR SERVICE
  do 
    echo "$ID) $SERVICE"
  done
  echo -e ""
  read SERVICE_ID_SELECTED

  # check if input is a number
  if [[ ! "$SERVICE_ID_SELECTED" =~ ^[0-9]+$ ]]
  then
    MAIN_MENU "Please enter a valid number."
  fi
  
  SERVICE_NAME=$(echo $($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED;") | sed -E 's/^ +//g')
  if [[ -z $SERVICE_NAME ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"
  fi

  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_NAME=$(echo "$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")" | sed -E 's/^ +//g')
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nWhat's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER="$($PSQL "INSERT INTO customers(name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE');")"
  fi
  
  echo -e "\nWhat time would you like to get your $SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME
  
  CUSTOMER_ID="$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")"
  INSERT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');")
  if [[ $INSERT_RESULT = 'INSERT 0 1' ]]
  then
    echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
  
  EXIT

}

EXIT() {
  echo "Thank you and we'll see you later!"
  exit 0
}

MAIN_MENU