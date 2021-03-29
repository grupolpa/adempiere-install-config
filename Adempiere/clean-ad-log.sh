#!/bin/sh
##########################################################################
#  Eliminar archivos de log de ADempiere y temporales de JBoss          ##
#                                                                       ##
#  Edwin Betancourt EdwinBetanc0rt@outlook.com                          ##
##########################################################################

# Se ubica en la carpeta de adempiere
if [ -n $ADEMPIERE_HOME ]; then
    cd $ADEMPIERE_HOME/
else
    cd /opt/Apps/Adempiere/
fi

# TODO: Verificar si existen las carpetas y archivos log para evitar mensajes:
# rm: no se puede borrar './*.log': No existe el fichero o el directorio
# rm: no se puede borrar './log/*.log': No existe el fichero o el directorio
# rm: no se puede borrar './jboss/server/adempiere/log/*.log': No existe el fichero o el directorio
# rm: no se puede borrar './jboss/server/adempiere/tmp/aopdynclasses/*': No existe el fichero o el directorio
# rm: no se puede borrar './jboss/server/adempiere/tmp/deploy/*': No existe el fichero o el directorio

# elimina los log de la raiz de adempiere
rm ./*.log
rm ./log/*.log

# elimina los log de jboss
rm ./jboss/server/adempiere/log/*.log
rm -R ./jboss/server/adempiere/tmp/aopdynclasses/*
rm -R ./jboss/server/adempiere/tmp/deploy/*

echo "**  Archivos log y temporales han sido borrados  **"
