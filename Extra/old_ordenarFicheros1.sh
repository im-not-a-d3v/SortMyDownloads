#!bin/bash

mkdir TEXTOS
mv *.txt *.pdf *.xlsx *.xlsm *.xlsb *.xltx TEXTOS
echo "***** Archivos de texto enviados a la carpeta TEXTOS *****"

mkdir AUDIOS
mv *.mp3 *.acc *.wav *.wma *.aiff *.ogg AUDIOS
echo "***** Archivos de audio enviados a la carpeta AUDIOS *****"

mkdir VIDEOS
mv *.mp4 *.avi *.mov *.wmv *.avchd *.flv *.f4v *.swf *.webm VIDEOS

mkdir IMAGENES
mv *.jpg *.jpge *.png *.gif IMAGENES

mkdir COMPRIMIDOS
mv *.rar *.zip *.7z COMPRIMIDOS

mkdir EJECUTABLES
mv *.exe EJECUTABLES

mkdir ISO-IMG
mv *.img *.iso ISO-IMG

mkdir OTROS
mv *.xml *.dll OTROS

sleep 5