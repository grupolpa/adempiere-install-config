#!/bin/sh
##########################################################################
#  Configurar PostgresSQL                                               ##
#                                                                       ##
#  Edwin Betancourt EdwinBetanc0rt@outlook.com                          ##
##########################################################################


# Permitir conexciones sin usuario de sistema operativo
sed -i 's/peer/md5/' /etc/postgresql/*/main/pg_hba.conf

# permitir todas las direcciones
sed -i "s|#listen_addresses = 'localhost'|listen_addresses = '*'|g" /etc/postgresql/*/main/postgresql.conf
sed -i "s|listen_addresses = 'localhost'|listen_addresses = '*'|g" /etc/postgresql/*/main/postgresql.conf


# aumentar el maximo de conexiones
sed -i "s|max_connections = 100|max_connections = 200|g" /etc/postgresql/*/main/postgresql.conf

# modificar la memoria compartida, debe ser 1/4 del total instalado
TOTAL_MEMORY=$(dmidecode -t memory | grep  Size: | grep -v "No Module Installed" | awk '{sum+=$2}END{print sum}')
SHARED_MEMORY=$(($TOTAL_MEMORY / 4))
sed -i "s|shared_buffers = 128MB|shared_buffers = ${SHARED_MEMORY}MB|g" /etc/postgresql/*/main/postgresql.conf


./env.sh

# Agregar la red para conexiones remotas
echo "host all all $NETWORK md5" >> /etc/postgresql/*/main/pg_hba.conf
echo "local all all $NETWORK md5" >> /etc/postgresql/*/main/pg_hba.conf

# Para que tome los cambios
service postgresql restart
# systemctl reload postgresql
