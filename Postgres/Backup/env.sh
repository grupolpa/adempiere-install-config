#!/bin/bash
##########################################################################
#  Variables de entorno PostgresSQL                                     ##
#                                                                       ##
#  Edwin Betancourt EdwinBetanc0rt@outlook.com                          ##
##########################################################################


BACKUP_DIR='/opt/Apps/backup/'
DATE=`date '+%Y-%m-%d_%H-%M'`
BACKUP_FILE="Empresa_$DATE.backup"
AD_USER='adempiere'
PGPASSWORD='123456' # adempiere db password
HOST='127.0.0.1'
PORT=5432
DB='adempiere'
