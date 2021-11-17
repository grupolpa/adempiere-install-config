#!/bin/sh
##########################################################################
#  Instalar PostgresSQL Client                                          ##
#                                                                       ##
#  Edwin Betancourt EdwinBetanc0rt@outlook.com                          ##
##########################################################################

# Create the file repository configuration:
# sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt buster-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

# Import the repository signing key:
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

# Update the package lists:
apt-get update

VERSION=$1
# change back to calling directory
if [ -n $VERSION ]
then
	VERSION="-${VERSION}"
fi

# Install the 9.6 version of PostgreSQL.
# apt-get -y install postgresql-9.6 postgresql-client-9.6
apt-get -y install postgresql-client${VERSION}
