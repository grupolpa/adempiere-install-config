#!/bin/sh
##########################################################################
#  Configurar PostgresSQL                                               ##
#                                                                       ##
#  Edwin Betancourt EdwinBetanc0rt@outlook.com                          ##
##########################################################################


# TODO: corrige error con el usuario su:
# "bash: dmidecode: orden no encontrada"
# cp /etc/login.defs /etc/login.defs.old
# echo "ALWAYS_SET_PATH yes" >> /etc/login.defs
# apt update && apt install -y dmidecode


# crea un respaldo del archivo anterior postgresql.conf
cp /etc/postgresql/*/main/postgresql.conf /etc/postgresql/*/main/postgresql.old.conf

# permitir todas las direcciones
sed -i "s|#listen_addresses = 'localhost'|listen_addresses = '*'|g" /etc/postgresql/*/main/postgresql.conf
sed -i "s|listen_addresses = 'localhost'|listen_addresses = '*'|g" /etc/postgresql/*/main/postgresql.conf


# aumentar el maximo de conexiones
sed -i "s|max_connections = 100|max_connections = 200|g" /etc/postgresql/*/main/postgresql.conf

# modificar la memoria compartida, debe ser 1/4 del total instalado
TOTAL_MEMORY=$(dmidecode -t memory | grep  Size: | grep -v "No Module Installed" | awk '{sum+=$2}END{print sum}')
SHARED_MEMORY=$(($TOTAL_MEMORY / 4))
echo "Memoria Total: $TOTAL_MEMORY, Memoria Compartida (Pg): $SHARED_MEMORY"
sed -i "s|shared_buffers = 128MB|shared_buffers = ${SHARED_MEMORY}MB|g" /etc/postgresql/*/main/postgresql.conf


# importa el archivo de configuracion
. ./env.sh

# crea un respaldo del archivo anterior pg_hba.conf
cp /etc/postgresql/*/main/pg_hba.conf /etc/postgresql/*/main/pg_hba.old.conf

# Permitir conexciones sin usuario de sistema operativo
sed -i 's|peer|md5|g' /etc/postgresql/*/main/pg_hba.conf


# Agregar la red para conexiones remotas
echo "host all all $NETWORK md5" >> /etc/postgresql/*/main/pg_hba.conf
# TODO: Agregar expresion regular que lea el inicio local y reemplace al final peer por trust
# echo "local all all trust" >> /etc/postgresql/*/main/pg_hba.conf

# Para que tome los cambios
service postgresql restart
# systemctl reload postgresql
