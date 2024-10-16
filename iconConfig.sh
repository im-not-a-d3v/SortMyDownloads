#!/bin/bash

# Definir la ruta de Downloads
DEST_DIR=$(eval echo "/c/Users/$(whoami)/Downloads")

# Función para crear el archivo desktop.ini con el ícono
create_icon_for_folder() {
    local folder="$1"
    local icon_path="$2"
    local ini_file="$folder/desktop.ini"

    # Verificar que la carpeta exista
    if [[ -d "$folder" ]]; then
        # Comprobar si desktop.ini ya existe y contiene el texto específico
        if [[ -f "$ini_file" ]] && grep -q "\[.ShellClassInfo\]" "$ini_file" && grep -q "IconResource=$icon_path" "$ini_file"; then
            echo "El archivo desktop.ini ya existe y contiene la información requerida en $folder. Se omite la creación."
        else
            echo "Creando desktop.ini en $folder..."
            
            # Crear archivo desktop.ini con el texto modificado
            {
                echo "[.ShellClassInfo]"
                echo "IconResource=$icon_path"
            } > "$ini_file"
            
            # Hacer que el archivo desktop.ini sea de sistema y oculto
            attrib +S +H "$ini_file"
            echo "Archivo desktop.ini creado y atributos aplicados."

            # Asegurar que la carpeta esté marcada como de sistema
            attrib +S "$folder"
        fi
    else
        echo "La carpeta $folder no existe."
    fi
}

# Función para eliminar el archivo desktop.ini y restablecer atributos
remove_icon_from_folder() {
    local folder="$1"
    local ini_file="$folder/desktop.ini"

    # Verificar que la carpeta exista
    if [[ -d "$folder" ]]; then
        # Verificar si desktop.ini existe
        if [[ -f "$ini_file" ]]; then
            echo "Eliminando desktop.ini de $folder..."
            
            # Restablecer los atributos de la carpeta para quitar el atributo de sistema
            attrib -S "$folder"
            
            # Eliminar el archivo desktop.ini
            rm -f "$ini_file"
            echo "Archivo desktop.ini eliminado de $folder."
        else
            echo "No se encontró archivo desktop.ini en $folder. Se omite la eliminación."
        fi
    else
        echo "La carpeta $folder no existe."
    fi
}

# Lista de carpetas que deben existir en Downloads y sus íconos
declare -A folders_icons
folders_icons=(
    ["TEXTS"]="%USERPROFILE%\\Downloads\\SCRIPTS\\SortMyDownloads\\assets\\icons\\Icons Pack 1\\icon_folders.ico,0"
    ["AUDIOS"]="%USERPROFILE%\\Downloads\\SCRIPTS\\SortMyDownloads\\assets\\icons\\Icons Pack 1\\icon_folders.ico,0"
    ["VIDEOS"]="%USERPROFILE%\\Downloads\\SCRIPTS\\SortMyDownloads\\assets\\icons\\Icons Pack 1\\icon_folders.ico,0"
    ["IMAGES"]="%USERPROFILE%\\Downloads\\SCRIPTS\\SortMyDownloads\\assets\\icons\\Icons Pack 1\\icon_folders.ico,0"
    ["COMPRESSED FILES"]="%USERPROFILE%\\Downloads\\SCRIPTS\\SortMyDownloads\\assets\\icons\\Icons Pack 1\\icon_folders.ico,0"
    ["EXECUTABLES"]="%USERPROFILE%\\Downloads\\SCRIPTS\\SortMyDownloads\\assets\\icons\\Icons Pack 1\\icon_folders.ico,0"
    ["SCRIPTS"]="%USERPROFILE%\\Downloads\\SCRIPTS\\SortMyDownloads\\assets\\icons\\Icons Pack 1\\icon_folders.ico,0"
    ["DISK IMAGES"]="%USERPROFILE%\\Downloads\\SCRIPTS\\SortMyDownloads\\assets\\icons\\Icons Pack 1\\icon_folders.ico,0"
    ["FOLDERS"]="%USERPROFILE%\\Downloads\\SCRIPTS\\SortMyDownloads\\assets\\icons\\Icons Pack 1\\icon_folders.ico,0"
    ["OTHERS"]="%USERPROFILE%\\Downloads\\SCRIPTS\\SortMyDownloads\\assets\\icons\\Icons Pack 1\\icon_folders.ico,0"
    ["SCRIPTS/SortMyDownloads"]="%USERPROFILE%\\Downloads\\SCRIPTS\\SortMyDownloads\\assets\\icons\\Icons Pack 1\\icon_home.ico,0"
)

# Solicitar al usuario si quiere activar o desactivar los íconos
echo "¿Deseas activar o desactivar los íconos personalizados de las carpetas?"
echo ""
echo "1. Activar Icons Pack #1 íconos."
echo "2. Activar Icons Pack #2 íconos."
echo "0. Desactivar íconos."
echo ""
read -p "Selecciona una opción: " user_choice

# Ejecutar la acción correspondiente según la elección del usuario
if [[ "$user_choice" == "1" ]]; then
    for folder in "${!folders_icons[@]}"; do
        create_icon_for_folder "$DEST_DIR/$folder" "${folders_icons[$folder]}"
    done
    echo "Íconos activados en las carpetas."
elif [[ "$user_choice" == "0" ]]; then
    for folder in "${!folders_icons[@]}"; do
        remove_icon_from_folder "$DEST_DIR/$folder"
    done
    echo "Íconos desactivados en las carpetas."
else
    echo "Opción no válida. Por favor, elige 1 o 2."
fi

# Proyecto "Sort My Downloads"
# Repositorio: https://github.com/im-not-a-d3v/SortMyDownloads.git