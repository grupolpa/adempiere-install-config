#!/bin/sh
################################################################################
#  Establecer contraseña para acceso desatendido AnyDesk                      ##
#  http://deb.anydesk.com/howto.html                                          ##
#                                                                             ##
#  Edwin Betancourt EdwinBetanc0rt@outlook.com                                ##
################################################################################

NUEVA_CLAVE="123456" # Cambiar contraseña
export $NUEVA_CLAVE

# Si existe un parametro lo toma como contraseña
if [ $1 ]
then
	NUEVA_CLAVE="-${1}"
fi

# establece contraseña o habilita pestaña de seguridad para acceso no vigilado
echo $NuevaClave  | anydesk --set-password
