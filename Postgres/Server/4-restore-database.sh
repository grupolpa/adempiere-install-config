#!/bin/sh
##########################################################################
#  Instalar PostgresSQL                                                 ##
#                                                                       ##
#  Edwin Betancourt EdwinBetanc0rt@outlook.com                          ##
##########################################################################

. ./env.sh

export $PGPASSWORD

# crea la base de datos
psql -c CREATE DATABASE $DB
    WITH ENCODING='UNICODE'
    OWNER=$USER;

# PGPASSWORD=$PGPASSWORD createdb -h $HOST -p $PORT -E UNICODE -O $USER -U $USER $DB

# createdb -h $HOST -p $PORT -E UNICODE -O $USER -U $USER $ADEMPIERE_DB_NAME

# nombre del archivo de la base de datos, puede ser .dmp o .backup
DATABASE_FILE='./seed.dmp'

# restaura el archivo en la base de datos
pg_restore -h $HOST -p $PORT -d $DB -U $USER -d $DATABASE_FILE;

echo "Base de Datos Restaurada"
# https://sqlbak.com/blog/how-to-automate-postgresql-database-backups-in-linux