#!/bin/sh

EXPOSE_PORT=8000

printf "postgres running check "

until pg_isready -h database > /dev/null 2>&1; do  
  printf "."
  sleep 3
done

printf '\npostgres loaded! \ndevelopment server start!\n'
python3 /app/manage.py runserver 0.0.0.0:$EXPOSE_PORT
