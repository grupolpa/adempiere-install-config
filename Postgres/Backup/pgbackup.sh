#!/bin/bash
##########################################################################
#  Configurar PostgresSQL                                               ##
#                                                                       ##
#  Edwin Betancourt EdwinBetanc0rt@outlook.com                          ##
##########################################################################

. ./env.sh

pg_dump -h $HOST -p 5432 --no-owner -U $USER -F c -b -v -f $BACKUP_DIR$BACKUP_FILE $DB

echo $BACKUP_DIR$BACKUP_FILE
