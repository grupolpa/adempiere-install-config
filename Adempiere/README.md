# ADempiere Instalación y Configuración

Se debe tomar en cuenta el máximo de memoria asignada para la ejecución de la maquina virtual java, para eso se debe modificar el archivo optApps/Adempiere/utils/myEnviroment.sh y modificar la variable de entorno ADEMPIERE_JAVA_OPTIONS, donde el -Xms establece el tamaño inicial y -Xmx el máximo, para java 7 y anteriores se usa -XX:PermSize para el inicial y -XX:MaxPermSize para el máximo, el tamaño maximo debe ser el 90% del tamaño libre en memoria (free -m) para que no cuelgue el sistema operativo. Los tamaños usan la notacion en K (kylo bytes) M (mega bytes) y G (giga bytes). Ejemplo para una maquina con 12gb pero con 7029mb libres, es decir 6326mb asignables:

`ADEMPIERE_JAVA_OPTIONS="-Xms256M -Xmx6326M -XX:PermSize=256M -XX:MaxPermSize=6326M -DADEMPIERE_HOME=$ADEMPIERE_HOME"`
