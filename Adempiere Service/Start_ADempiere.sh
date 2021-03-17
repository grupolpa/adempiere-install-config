#!/bin/sh
##########################################################################
#  Script de arranque del servicio de ADempiere                         ##
#  Instalado como servicio del sistema operativo con systemd            ##
#                                                                       ##
#  Edwin Betancourt EdwinBetanc0rt@outlook.com                          ##
##########################################################################

# Se ubica en la carpeta de adempiere utils
if [ $ADEMPIERE_HOME ]; then
    cd $ADEMPIERE_HOME/utils
else
    cd /opt/Apps/Adempiere/utils
fi

# detiene el servicio
sh ./RUN_Server2.sh
