#!/bin/sh
##########################################################################
#  Instalar Java JDK y desinstalar OpenJDK                              ##
#                                                                       ##
#  Edwin Betancourt EdwinBetanc0rt@outlook.com                          ##
##########################################################################

# eliminar Openjdk junto con las dependencias
apt-get remove --auto-remove openjdk*

# eliminar Openjdk junto con las dependencias y sus archivos de configuración
#apt-get purge --auto-remove openjdk*

# Archivo de instalacion del paquete Java
JAVA_BINARY=jdk-7u80-linux-x64.tar.gz

# descomprime java en la ubicacion de las java virtual machine
mkdir -p /var/lib/jvm/java
tar -C /var/lib/jvm/java -zxvf $JAVA_BINARY

JAVA_HOME="/var/lib/jvm/java/jdk1.7.0_80"
# export $JAVA_HOME

# establece las variables de entorno
echo "JAVA_HOME=${JAVA_HOME}" >> /etc/profile
echo "export JAVA_HOME=${JAVA_HOME}" >> /etc/profile
echo "export JAVA_JRE=${JAVA_HOME}/jre" >> /etc/profile
echo "export PATH=\"$PATH:${JAVA_JOME}/bin\"" >> /etc/profile

# obtiene las variables de entorno para actualizar el contexto del shell
# source /etc/profile
. /etc/profile

# permisos de ejecución al directorio de java 
chmod +x -R $JAVA_HOME
chmod +x -R /usr/local/java
chmod +x -R /usr/local/javac

#TODO: Revisar advertencias de las alternativas
# instala las las alternativas de java
update-alternatives --install /usr/bin/java java $JAVA_HOME/bin/java 1
update-alternatives --install /usr/bin/javac javac $JAVA_HOME/bin/javac 1
# update-alternatives --install /usr/bin/javaws javaws $JAVA_HOME/bin/javaws 1

# configura de modo interativo las alternativas java
# update-alternatives --config java

# configura de modo manual las alternativas java
update-alternatives --set java $JAVA_JOME/bin/java
update-alternatives --set javac $JAVA_JOME/bin/javac
# update-java-alternatives -s $JAVA_JOME # no funciona

java -version

# elimina enlaces simbolicos si da error 
# rm -r /usr/bin/java
# rm -r /usr/bin/javac
