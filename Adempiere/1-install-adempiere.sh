#!/bin/sh
##########################################################################
#  Instalar y establecer de entorno de ADempiere                        ##
#                                                                       ##
#  Edwin Betancourt EdwinBetanc0rt@outlook.com                          ##
##########################################################################

WORKSPACE="/opt/Apps/"

# Crea la carpeta de trabajo si no existe
if [ ! -e $WORKSPACE ]; then
    mkdir -p $WORKSPACE
fi


# copiar el .zip a carpeta de trabajo
cp ./Adempiere.zip $WORKSPACE/


# se ubica en la carpeta de trabajo
cd $WORKSPACE

# descomprime los archivos
unzip -oq Adempiere.zip

# si existe cambia el archivo de conexion
if [ -e Adempiere.properties ]; then
    mv Adempiere.properties Adempiere_old.properties
fi
# si existe cambia el archivo de variables de entorno
if [ -e AdempiereEnv.properties ]; then
    mv AdempiereEnv.properties AdempiereEnv_old.properties
fi

# concede los permisos completos
chmod 777 -R $WORKSPACE

# establece la variable de entorno
echo "export ADEMPIERE_HOME=/opt/Apps/Adempiere" >> /etc/profile

# source /etc/profile
. /etc/profile
