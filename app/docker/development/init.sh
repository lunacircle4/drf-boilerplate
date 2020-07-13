#!/bin/sh

printf "postgres running check ..."
until pg_isready -h database > /dev/null 2>&1; do  
  printf "."
  sleep 3
done
printf '\npostgres loaded! \n start migration ...\n'

python3 /app/manage.py makemigrations
python3 /app/manage.py migrate
echo "migration success!"
