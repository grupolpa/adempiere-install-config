@ECHO OFF

GOTO :date

:date
    :: set hours value
    SET H=%time:~0,2%
    IF "%H:~0,1%" == " " (
        set H=0%H:~1,1%
    )
    :: set minutes value
    SET M=%time:~3,2%
    IF "%M:~0,1%" == " " (
        SET M=0%M:~1,1%
    )
    :: set secs value
    SET S=%time:~6,2%
    IF "%S:~0,1%" == " " (
        SET S=0%S:~1,1%
    )
    :: set month value
    SET m=%date:~3,2%
    IF "%m:~0,1%" == " " (
        SET m=0%m:~1,1%
    )
    :: set day value
    SET d=%date:~0,2%
    IF "%d:~0,1%" == " " (
        SET d=0%d:~1,1%
    )
    :: set year value
    SET Y=%date:~-4%
:: end date


SET FILE=TNP_%Y%-%m%-%d%_%H%-%M%-%S%.backup
SET FOLDER=C:\compartidatnp\backup_db\

ECHO ON
echo %FOLDER%%FILE%
:: Respaldo a la base de datos


SET PGPASSWORD=007cH#.

pg_dump -h 192.168.0.6 -U adempiere -d adempiere -Fc -b -v -f %FOLDER%%FILE%