#!/bin/sh
##########################################################################
#  Crear tarea programada para respaldos de la base de datos            ##
#                                                                       ##
#  Edwin Betancourt EdwinBetanc0rt@outlook.com                          ##
##########################################################################

WORKSPACE="/opt/Apps/backup"

# copiar scripts a carpeta de trabajo
cp ./env.sh $WORKSPACE/
cp ./pgbackup.sh $WORKSPACE/

# da permisos completos a la carpeta para ejecutar los scripts
# y permisos para escribir nuevos ficheros
chmod 777 -R $WORKSPACE/


(crontab -l 2>/dev/null || true; echo "# Se ejecutara diario a las 06:00 AM y 06:00 PM") | crontab -
(crontab -l 2>/dev/null || true; echo "0 06,18 * * * $WORKSPACE/pgbackup.sh") | crontab -


# echo "# Se ejecutara diario a las 06:00 AM y 06:00 PM" >> /var/spool/cron/crontabs/$USER
# echo "0 06,18 * * * $WORKSPACE/pgbackup.sh" >> /var/spool/cron/crontabs/$USER

# chmod 600 /var/spool/cron/crontabs/$USER
