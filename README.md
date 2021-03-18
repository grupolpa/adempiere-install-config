# ADempiere Install Config

Instalar y Configurar el entorno en Linux Debian, de aplicación ADempiere y base de datos bajo PostgreSQL.

## Aplicativo ADempiere
* Instalación de Java y su configuración como alternativas java del sistema operativo, ademas de sus variables de entorno.
* Crear servicio de ADempiere para arrancar y detener el servicio.
* Crear tarea programada para limpiar mensualmente los archivos log de ADempiere, y los archivos log y temporales del JBoss (servidor web para despliegue del ZK de ADempiere).

## Servidor de Base de Datos
* Instalar PostgreSQL Server.
* Configurar para permitir conexiones en la red local.
* Configurar usuarios para ADempiere.
* Crear y restaurar base de datos de PostgreSQL.

## Respaldo de Base de Datos
* Instalar PostgreSQL Client.
* Crear tarea programada para respaldos diarios.

## Acceso remoto
* Instalar acceso remoto AnyDesk.
* Establecer contraseña para acceso no vigilado.

## To Do (Por Hacer):
* Cambiar contraseña del usuario PostgreSQl. Ya que por ahora debe iniciarse sesion con el usuario postgres a nivel de sistema operativo para poder hacer cambio de contraseña.
* Instalar ADempiere y paquetes, sea con un release especifico, y/o con paquetes (y paquetes zk).
* Hacer los scripts interactivos y/o guiados por el usuario.
* Crear scripts compatibles con MS Window (con batch script o evaluar python).
