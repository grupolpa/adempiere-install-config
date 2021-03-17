#!/bin/sh
################################################################################
#  Instalar acceso remoto AnyDesk                                             ##
#  http://deb.anydesk.com/howto.html                                          ##
#                                                                             ##
#  Edwin Betancourt EdwinBetanc0rt@outlook.com                                ##
################################################################################

# Instala las llaves del repositorio
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -

# Agrega el repositorio
echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list

# Actualiza la lista de aplicaciones disponibles de los repositorios
apt update

# Instala la aplicacion de Acceso Remoto
apt install -y anydesk
