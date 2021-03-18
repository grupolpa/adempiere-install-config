#!/bin/bash
##########################################################################
#  Configurar PostgresSQL                                               ##
#                                                                       ##
#  Edwin Betancourt EdwinBetanc0rt@outlook.com                          ##
##########################################################################


# se ubica en el directorio con los scripts
cd /opt/Apps/backup

# importa las variables de entorno
. ./env.sh

# exporta la contraseña para que no sea solicitada
export PGPASSWORD

# crea el respaldo en la ruta indicada
pg_dump -h $HOST -p $PORT -U $USER -d $DB -Fc -b -v -f $BACKUP_DIR$BACKUP_FILE


echo "***************************************************************"
echo "**** Copia de seguridad de la BD generada en el archivo: ******"
echo "****      ${BACKUP_DIR}${BACKUP_FILE}      ****"
echo "***************************************************************"
