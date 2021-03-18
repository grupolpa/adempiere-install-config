#!/bin/sh
##########################################################################
#  Configurar PostgresSQL                                               ##
#                                                                       ##
#  Edwin Betancourt EdwinBetanc0rt@outlook.com                          ##
##########################################################################


# Para que tome los cambios
service postgresql restart

./env.sh

export $PGPASSWORD

$NEW_PASSWORD=$PGPASSWORD

# Establecer nueva contrase;a para postgres
PGPASSWORD=postgres psql -U postgres -d postgres -c "ALTER USER postgres WITH PASSWORD '$NEW_PASSWORD';"

su - postgres -c "psql -U postgres -d postgres -c \"ALTER USER postgres WITH PASSWORD '$NEW_PASSWORD';\""


# psql -c \"CREATE USER &1 WITH CREATEDB CREATEUSER PASSWORD '&2'
AD_PASSWORD=$PGPASSWORD
$PGPASSWORD=$NEW_PASSWORD

psql -c \"CREATE ROLE $USER WITH
	LOGIN
	SUPERUSER
	CREATEDB
	CREATEROLE
	NOINHERIT
	NOREPLICATION
	CONNECTION LIMIT -1
	PASSWORD '$AD_PASSWORD';\"
