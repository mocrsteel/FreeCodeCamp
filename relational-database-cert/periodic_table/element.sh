#!/bin/bash
PSQL="psql -U freecodecamp periodic_table -X --tuples-only -c"
DATA_QUERY_PARTIAL="
  SELECT 
    atomic_number,
    name,
    symbol,
    type,
    atomic_mass,
    melting_point_celsius,
    boiling_point_celsius 
  FROM elements 
  LEFT JOIN properties USING(atomic_number)
  LEFT JOIN types USING(type_id)
"

DISPLAY_DATA () {
  ELEMENT=$1
  if [[ -z $ELEMENT ]]
  then
    echo "I could not find that element in the database."
  else
    echo "$ELEMENT" | while read ATOMIC DASH NAME DASH SYMBOL DASH TYPE DASH MASS DASH MELTING DASH BOILING
    do
      echo "The element with atomic number $ATOMIC is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius." 
    done
  fi
}

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  # Element atomic_number given as input
  if [[ ! "$1" =~ ^[0-9]+$ ]]
  then
    # not a number
    if [[ "$1" =~ ^[A-Z]{1}[a-z]{0,1}$ ]]
    then
      # element symbol given (only 1 or 2 characters).
      ELEMENT=$($PSQL "$DATA_QUERY_PARTIAL WHERE symbol='$1';")
      DISPLAY_DATA "$ELEMENT"
    else
      # more than 2 letters, so name.
      ELEMENT=$($PSQL "$DATA_QUERY_PARTIAL WHERE name='$1';")
      DISPLAY_DATA "$ELEMENT"
    fi
  else
    # input is a number
    ELEMENT=$($PSQL "$DATA_QUERY_PARTIAL WHERE atomic_number=$1;")
    DISPLAY_DATA "$ELEMENT"
  fi  
fi



