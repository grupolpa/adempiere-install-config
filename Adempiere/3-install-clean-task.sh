#!/bin/sh
##########################################################################
#  Crear tarea programada para respaldos de la base de datos            ##
#                                                                       ##
#  Edwin Betancourt EdwinBetanc0rt@outlook.com                          ##
##########################################################################

WORKSPACE="/opt/Apps"

# Crea la carpeta de trabajo si no existe
if [ ! -e $WORKSPACE ]; then
    mkdir -p $WORKSPACE
fi


# copiar scripts a carpeta de trabajo
cp ./clean-log.sh $WORKSPACE/

# da permisos completos para ejecutar y modificar scripts
chmod 777 $WORKSPACE/clean-ad-log.sh


(crontab -l 2>/dev/null || true; echo "# Se ejecutara mensualmente") | crontab -
(crontab -l 2>/dev/null || true; echo "0 0 1 * * $WORKSPACE/clean-log.sh") | crontab -
# (crontab -l 2>/dev/null || true; echo "@monthly $WORKSPACE/clean-log.sh") | crontab -

# echo "# Se ejecutara mensualmente" >> /var/spool/cron/crontabs/$USER
# echo "0 0 1 * * $WORKSPACE/clean-log.sh" >> /var/spool/cron/crontabs/$USER
# echo "@monthly $WORKSPACE/clean-log.sh" >> /var/spool/cron/crontabs/$USER

# chmod 600 /var/spool/cron/crontabs/$USER
