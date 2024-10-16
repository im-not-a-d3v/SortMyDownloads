#!/bin/bash

# Script padre de donde l

# Crear directorios si no existen
mkdir -p TEXTOS AUDIOS VIDEOS IMAGENES COMPRIMIDOS EJECUTABLES ISO-IMG OTROS

# Mover archivos a sus respectivos directorios
mv *.txt *.pdf *.xlsx *.xlsm *.xlsb *.xltx *.xls *.docx *.pptx TEXTOS 2>/dev/null
mv *.mp3 *.acc *.wav *.wma *.aiff *.ogg AUDIOS 2>/dev/null
mv *.mp4 *.avi *.mov *.wmv *.avchd *.flv *.f4v *.swf *.webm VIDEOS 2>/dev/null
mv *.jpg *.jpge *.png *.gif *.webp *.ico *.psd IMAGENES 2>/dev/null
mv *.rar *.zip *.7z COMPRIMIDOS 2>/dev/null
mv *.exe EJECUTABLES 2>/dev/null
mv *.img *.iso ISO-IMG 2>/dev/null
mv *.xml *.dll *.bin OTROS 2>/dev/null

# Mensaje de salida
echo "***** Archivos organizados correctamente *****"

exit
