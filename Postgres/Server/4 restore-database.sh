#!/bin/sh
##########################################################################
#  Instalar PostgresSQL                                                 ##
#                                                                       ##
#  Edwin Betancourt EdwinBetanc0rt@outlook.com                          ##
##########################################################################
./env.sh

# crea la base de datos
psql -c CREATE DATABASE $DB
    WITH ENCODING='UNICODE'
    OWNER=$USER;

-- PGPASSWORD=$dbPwd createdb -h $dbHost -p $dbPort -E UNICODE -O $dbUser -U $dbUser $dbName

# nombre del archivo de la base de datos, puede ser .dmp o .backup
DATABASE_FILE='./seed.dmp'

# restaura el archivo en la base de datos
pg_restore -h $HOST -p $PORT -d $DB -U $USER -d $DATABASE_FILE;

echo "Base de Datos Restaurada"
