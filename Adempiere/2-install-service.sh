#!/bin/sh
##########################################################################
#  Instalar el servicio de ADempiere en el sistema operativo            ##
#                                                                       ##
#  Edwin Betancourt EdwinBetanc0rt@outlook.com                          ##
##########################################################################

WORKSPACE="/opt/Apps/"

# Crea la carpeta de trabajo si no existe
if [ ! -e $WORKSPACE ]; then
    mkdir -p $WORKSPACE
fi

# copia los archivos a la carpeta de trabajo
cp ./Start_ADempiere.sh $WORKSPACE
cp ./Stop_ADempiere.sh $WORKSPACE

# copia el archivo de servicio a la carpera del sistema de servicios
cp ./Adempiere.service /etc/systemd/system/

# Concede permisos al contenido de la carpeta
chmod 777 -R $WORKSPACE

# Habilita el servicio de adempiere para que se inicie con el sistema operativo
systemctl enable Adempiere

# Reiniciar el servicio de adempiere
# systemctl restart Adempiere
