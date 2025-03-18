Este script te permitira crear una copia de tu base de datos de MYSQL-server usando mysqldump.

Para que funcione usamos bash OHEV-Oscar_Hernandez_Vega.sh -u <usuario> -d <base_datos> -o <ruta_archivo_respaldo>

Al ejecutarse te pedira la contraseña del servidor solo una vez, asegurate de no equivocarte.

Y si todo sale bien tendras tu copia en la ruta que elegiste con el nombre que elegiste de tu base de datos.

Se vera asi: "respaldo exitoso: <nombre_del_respaldo>.gz"

Espero que esto te facilite un poco la vida a la hora de hacer tus copias de seguridad.

Para ejecutar este script ocupas instalar gzip y mysql-server que ya tiene mysqldump por defecto; y si quieres ir mas rápido podrias usar un usuario de administrador usando el comando sudo su para evitar algún conflicto de permisos.
Ejemplo:
root@TheMasterPC:/home/oscar/reto2# bash OHEV-Oscar_Hernandez_Vegav2.sh -u root -d OHEV.sql -o /tmp/OHEV.sql
Ingrese la contraseña para el usuario root:
Iniciando respaldo...
Usuario: root
Base de datos: OHEV.sql
Destino: /tmp/OHEV.sql
respaldo exitoso: OHEV.gz

