
:: COPY 

SCHTASKS /CREATE /SC DAILY /TN "Respaldo BD 06 am" /TR "C:\Apps\run_pg_backup.cmd" /ST 06:00
:: SCHTASKS /CREATE /SC DAILY /TN "Respaldo BD 06 am" /TR "C:\Apps\run_pg_backup.cmd" /ST 06:00 /RU USER-ACCOUNT


SCHTASKS /CREATE /SC DAILY /TN "Respaldo BD 06 pm" /TR "C:\Apps\run_pg_backup.cmd" /ST 18:00
:: SCHTASKS /CREATE /SC DAILY /TN "Respaldo BD 06 pm" /TR "C:\Apps\run_pg_backup.cmd" /ST 18:00 /RU USER-ACCOUNT
