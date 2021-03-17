#!/bin/sh
##########################################################################
#  Instalar el servicio de ADempiere en el sistema operativo            ##
#                                                                       ##
#  Edwin Betancourt EdwinBetanc0rt@outlook.com                          ##
##########################################################################

# Crea la carpeta de trabajo
mkdir -p /opt/Apps

cp ./Start_ADempiere.sh /opt/Apps/
cp ./Stop_ADempiere.sh /opt/Apps/

# copia el archivo de servicio a la carpera del sistema de servicios
cp ./Adempiere.service /etc/systemd/system/

# Habilita el servicio de adempiere para que se inicie con el sistema operativo
systemctl enable Adempiere

# Permisos a la carpeta
chmod 777 -R /opt/Apps

# Reiniciar el servicio de adempiere
systemctl restart Adempiere
