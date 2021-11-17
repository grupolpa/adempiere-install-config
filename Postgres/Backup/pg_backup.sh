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

if [ -n $1 ]
then
    DB=$1
    BACKUP_FILE="${DB}_${DATE}.backup"
fi

echo "creando archivo de respaldo de base de datos..."

# crea el respaldo en la ruta indicada
pg_dump -h $HOST -p $PORT -U $AD_USER -d $DB -Fc -b -v -f $BACKUP_DIR$BACKUP_FILE

echo "***************************************************************"
echo "****  Copia de seguridad de la BD generada en el archivo   ****"
echo "****     ${BACKUP_DIR}${BACKUP_FILE}      ****"
echo "***************************************************************"
echo ""


echo ""
echo "creando comprimido de respaldo de base de datos..."
# comprime el archivo en 7zip
7z a $BACKUP_DIR$BACKUP_FILE.7z $BACKUP_DIR$BACKUP_FILE

echo "***************************************************************"
echo "****        Comprimir Copia de seguridad de la BD          ****"
echo "****   ${BACKUP_DIR}${BACKUP_FILE}.7z     ****"
echo "***************************************************************"
echo ""


echo ""
echo "eliminar el archivo $BACKUP_DIR$BACKUP_FILE"
# elimina el respaldo sin compresion
rm $BACKUP_DIR$BACKUP_FILE
