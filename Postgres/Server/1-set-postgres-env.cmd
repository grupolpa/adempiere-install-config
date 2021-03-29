@ECHO OFF
:: The script sets environment variables helpful for PostgreSQL
:::: TODO: Add change and confirm values
:: @author Edwin Betancourt <EdwinBetanc0urt@outlook.com>

SETX /M PG_HOME "%PROGRAMFILES%\PostgreSQL\9.6"
:: SETX /M PG_HOME "%PROGRAMFILES%\PostgreSQL\12"

SETX /M PATH "%PG_HOME%\bin;%PATH%"
SETX /M PGDATA "%PG_HOME%\data"
SETX /M PGDATABASE "postgres"
SETX /M PGUSER "postgres"
SETX /M PGPORT 5432
SETX /M PGLOCALEDIR "%PG_HOME%\share\locale"
