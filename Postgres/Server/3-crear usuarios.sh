#!/bin/sh
##########################################################################
#  Configurar PostgresSQL                                               ##
#                                                                       ##
#  Edwin Betancourt EdwinBetanc0rt@outlook.com                          ##
##########################################################################

. ./env.sh

export $PGPASSWORD

$NEW_PASSWORD=$PGPASSWORD

# Establecer nueva contrase;a para postgres
# PGPASSWORD=postgres psql -U postgres -d postgres -c "ALTER USER postgres WITH PASSWORD '$NEW_PASSWORD';"
psql -U postgres -d postgres -c "ALTER USER postgres WITH PASSWORD '$NEW_PASSWORD';"

# TODO: Agregar soporte para autentificacion peer
# su - postgres -c "psql -U postgres -d postgres -c \"ALTER USER postgres WITH PASSWORD '153*Zb$';\""

AD_PASSWORD=$PGPASSWORD
$PGPASSWORD=$NEW_PASSWORD

# Elimina el usuario en caso de que exista
# dropuser -U postgres $USER

# psql -c \"CREATE USER &1 WITH CREATEDB CREATEUSER PASSWORD '&2'
# CREATE_AD_ROLE_SQL="CREATE ROLE $USER SUPERUSER LOGIN PASSWORD '$AD_PASSWORD'"
# psql -U postgres -c $CREATE_AD_ROLE_SQL
# -s SuperUser, -l LogIn, -P Prompt new password 
# createuser -h $HOST -p $PORT -s -l -P -e $USER
psql -c \"CREATE ROLE $USER WITH
	LOGIN
	SUPERUSER
	CREATEDB
	CREATEROLE
	NOINHERIT
	NOREPLICATION
	CONNECTION LIMIT -1
	PASSWORD '$AD_PASSWORD';\"

# psql -U postgres << EOF
#	CREATE ROLE $USER WITH
#		LOGIN
#		SUPERUSER
#		CREATEDB
#		CREATEROLE
#		NOINHERIT
#		NOREPLICATION
#		CONNECTION LIMIT -1
#		PASSWORD '$AD_PASSWORD';
#	COMMENT ON ROLE $USER IS 'Usuario para ADempiere';
# EOF