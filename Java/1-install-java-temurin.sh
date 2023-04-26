#!/bin/sh
##########################################################################
#  Instalar Java JDK y desinstalar OpenJDK                              ##
#                                                                       ##
#  Edwin Betancourt EdwinBetanc0rt@outlook.com                          ##
##########################################################################

# Para instalar una versión especifica ejecutar por ejemplo:
# sh 1-install-java-temurin.sh 8
# donde el ultimo número establece la versión, si no se especifica tomara la
# versión 11 por defecto, solo compatible con las versiones 9, 11 y 17


# eliminar Openjdk junto con las dependencias
apt-get remove --auto-remove openjdk*

# Asegúrese de que están presentes los paquetes necesarios:
apt install -y wget apt-transport-https

# Descargue la clave GPG de Eclipse Adoptium:
mkdir -p /etc/apt/keyrings
wget -O - https://packages.adoptium.net/artifactory/api/gpg/key/public | tee /etc/apt/keyrings/adoptium.asc

# Configurar el repositorio apt de Eclipse Adoptium.
# Para comprobar la lista completa de versiones soportadas echa un vistazo a la
# lista en el árbol en https://packages.adoptium.net/ui/native/deb/dists/
echo "deb [signed-by=/etc/apt/keyrings/adoptium.asc] https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list


JAVA_VERSION=11
if [$0 == 8 || $0 == 11 || $0 == 17]
then
    # cambia la version del java por el argumento
    JAVA_VERSION=$1
fi

# Instale la versión de Temurin que necesite:
apt update
# apt install -y temurin-11-jdk
apt install -y temurin-$JAVA_VERSION-jdk
