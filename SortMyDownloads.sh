#!/bin/bash

##################################################################
##################################################################
##  ____             _     __  __                               ##
## / ___|  ___  _ __| |_  |  \/  |_   _                         ##   
## \___ \ / _ \| '__| __| | |\/| | | | |                        ##
##  ___) | (_) | |  | |_  | |  | | |_| |                        ##
## |____/ \___/|_|   \__| |_| _|_|\__, |        _               ##
## |  _ \  _____      ___ __ | | _|___/__ _  __| |___           ##
## | | | |/ _ \ \ /\ / / '_ \| |/ _ \ / _` |/ _` / __|          ##
## | |_| | (_) \ V  V /| | | | | (_) | (_| | (_| \__ \          ##
## |____/ \___/ \_/\_/ |_| |_|_|\___/ \__,_|\__,_|___/ v2.0.0   ##
##                                                              ##
####################github.com/im-not-a-d3v#######################
##################################################################

# Definir la ruta de destino con el usuario actual
DEST_DIR=$(eval echo "/c/Users/$(whoami)/Downloads")

# Crear directorios si no existen
mkdir -p "$DEST_DIR"/{TEXTS,AUDIOS,VIDEOS,IMAGES,'COMPRESSED FILES',EXECUTABLES,SCRIPTS,'DISK IMAGES',FOLDERS,OTHERS}

# Función para mover archivos con renombrado si existe
move_with_rename() {
    local src_file="$1"
    local dest_dir="$2"

    # Obtener el nombre base y la extensión del archivo
    local base_name="${src_file##*/}"  # Extraer solo el nombre del archivo
    local dest_file="$dest_dir/$base_name"  # Inicializar el nombre del archivo de destino

    # Comprobar si el archivo ya existe
    if [[ -e "$dest_file" ]]; then
        # Generar un nuevo nombre si el archivo ya existe
        local copy_count=1
        while [[ -e "$dest_dir/${base_name%.exe}_copy$copy_count.exe" ]]; do
            ((copy_count++))
        done
        dest_file="$dest_dir/${base_name%.exe}_copy$copy_count.exe"
    fi

    # Mover el archivo
    mv "$src_file" "$dest_file"
}

# Mover archivos a sus respectivos directorios
# TEXTS
for file in "$DEST_DIR"/*.{txt,pdf,xlsx,xlsm,xlsb,xltx,xls,docx,pptx,odt,rtf,csv,md,epub,mobi}; do
    [[ -e "$file" ]] && move_with_rename "$file" "$DEST_DIR/TEXTS"
done

# AUDIOS
for file in "$DEST_DIR"/*.{mp3,acc,wav,wma,aiff,ogg,m4a,flac,alac,opus}; do
    [[ -e "$file" ]] && move_with_rename "$file" "$DEST_DIR/AUDIOS"
done

# VIDEOS
for file in "$DEST_DIR"/*.{mp4,avi,mov,wmv,avchd,flv,f4v,swf,webm,mkv,m4v,3gp,ts,m2ts}; do
    [[ -e "$file" ]] && move_with_rename "$file" "$DEST_DIR/VIDEOS"
done

# IMAGES
for file in "$DEST_DIR"/*.{jpg,jpeg,png,gif,webp,ico,psd,ai,tiff,bmp,svg,tga}; do
    [[ -e "$file" ]] && move_with_rename "$file" "$DEST_DIR/IMAGES"
done

# "COMPRESSED FILES"
for file in "$DEST_DIR"/*.{rar,zip,7z,tar,gz,bz2,xz}; do
    [[ -e "$file" ]] && move_with_rename "$file" "$DEST_DIR/COMPRESSED FILES"
done

# EXECUTABLES
for file in "$DEST_DIR"/*.{exe,msi,deb,rpm,apk,appimage}; do
    [[ -e "$file" ]] && move_with_rename "$file" "$DEST_DIR/EXECUTABLES"
done

# SCRIPTS
for file in "$DEST_DIR"/*.{sh,bat,py,js,php,pl,rb,ps1}; do
    [[ -e "$file" ]] && move_with_rename "$file" "$DEST_DIR/SCRIPTS"
done

# DISK IMAGES
for file in "$DEST_DIR"/*.{iso,img,dmg,vhd,vhdx,vmdk,bin,cue,nrg,mdf,mds,udif}; do
    [[ -e "$file" ]] && move_with_rename "$file" "$DEST_DIR/DISK IMAGES"
done

# Mover carpetas restantes a FOLDERS
for folder in "$DEST_DIR"/*; do
    if [[ -d "$folder" ]]; then
        # Si estamos en la carpeta actual de ejecución (SortMyDownloads), copiar los archivos necesarios
        if [[ "$(realpath "$folder")" == "$(realpath "$PWD")" ]]; then
            mkdir -p "$DEST_DIR/SCRIPTS/SortMyDownloads"
            cp ./SortMyDownloads.sh "$DEST_DIR/SCRIPTS/SortMyDownloads/"
            cp ./iconConfig.sh "$DEST_DIR/SCRIPTS/SortMyDownloads/"
            cp -r ./assets "$DEST_DIR/SCRIPTS/SortMyDownloads/"
        elif [[ ! "$folder" =~ /TEXTS|/AUDIOS|/VIDEOS|/IMAGES|/"COMPRESSED FILES"|/EXECUTABLES|/SCRIPTS|/"DISK IMAGES"|/OTHERS|/FOLDERS ]]; then
            mv "$folder" "$DEST_DIR/FOLDERS/"
        fi
    fi
done


# Mover archivos no clasificados a OTHERS
for file in "$DEST_DIR"/*; do
    # Si el archivo no ha sido movido a ninguna de las categorías anteriores y no es una carpeta
    if [[ -e "$file" && ! -d "$file" && ! "$file" =~ \.(txt|pdf|xlsx|xlsm|xlsb|xltx|xls|docx|pptx|odt|rtf|csv|md|epub|mobi|mp3|acc|wav|wma|aiff|ogg|m4a|flac|alac|opus|mp4|avi|mov|wmv|avchd|flv|f4v|swf|webm|mkv|m4v|3gp|ts|m2ts|jpg|jpeg|png|gif|webp|ico|psd|tiff|bmp|svg|tga|rar|zip|7z|tar|gz|bz2|xz|exe|msi|deb|rpm|apk|appimage|sh|bat|py|js|php|pl|rb|ps1|img|iso|dmg|vhd|vhdx|vmdk|bin|cue|nrg|mdf|mds|udif)$ ]]; then
        move_with_rename "$file" "$DEST_DIR/OTHERS"
    fi
done

# Mensaje de salida
echo "Script version v1.0.0"
echo "Files organized correctly!"

exit
