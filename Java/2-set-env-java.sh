#!/bin/sh
##########################################################################
#  Establecer las variables de entorno para JAVA                        ##
#                                                                       ##
#  Edwin Betancourt EdwinBetanc0rt@outlook.com                          ##
##########################################################################

# establecer la variable de entorno JAVA_HOME en todo el sistema operativo
echo -e "\nexport JAVA_HOME=/usr/bin/java\n" >> /etc/profile

source /etc/profile
echo "Por favor cerrar sesión para tomar los cambios"
echo ""
echo "JAVA_HOME=$JAVA_HOME"
