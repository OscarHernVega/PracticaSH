#!/bin/bash

# Función para mostrar ayuda
mostrar_ayuda() {
    echo "Usa: $0 -u <usuario> -d <base_datos> -o <ruta_archivo>"
    echo "  -u    Usuario de la base de datos (obligatorio)"
    echo "  -d    Nombre de la base de datos (obligatorio)"
    echo "  -o    Ruta y nombre del archivo de respaldo /<ruta_del_archivo>/<nombre_del_archivo>.sql(obligatorio)"
    echo "  -h    Mostrar esta ayuda"
    exit 0
}

# Variables predeterminadas
ARCHIVO_BACKUP="/tmp/IS.sql"

# Procesar opciones de línea de comandos
while getopts ":u:d:o:h" opt; do
    case ${opt} in
        u) USUARIO="$OPTARG" ;;
        d) BASE_DATOS="$OPTARG" ;;
        o) ARCHIVO_BACKUP="$OPTARG" ;;
        h) mostrar_ayuda ;;
        :) echo "Error: La opción -$OPTARG requiere un argumento." >&2; exit 1 ;;
        *) echo "Opción inválida: -$OPTARG" >&2; exit 1 ;;
    esac
done

# Verificar si se proporcionaron los argumentos obligatorios
if [[ -z "$USUARIO" || -z "$BASE_DATOS" || -z "$ARCHIVO_BACKUP" ]]; then
    echo "Error: Usuario, base de datos y ruta de backup son obligatorios." >&2
    mostrar_ayuda
fi

# Solicitar la contraseña de manera segura
read -s -p "Ingrese la contraseña para el usuario $USUARIO: " PASSWORD
echo ""

# Función para realizar el respaldo
realizar_respaldo() {
    echo "Iniciando respaldo..."
    echo "Usuario: $USUARIO"
    echo "Base de datos: $BASE_DATOS"
    echo "Destino: $ARCHIVO_BACKUP"

    sudo mysqldump -u "$USUARIO" -p"$PASSWORD" "$BASE_DATOS" > "$ARCHIVO_BACKUP" 2>/dev/null
    result = $?
    if [ "$result" == 0 ]; then
        echo "respaldo exitoso: $output.gz"
        gzip $output
    fi
}

# Ejecutar el respaldo
realizar_respaldo
