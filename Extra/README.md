# Versiones iniciales

Antes de hacer un proyecto mas robusto y que pudiese compartir con la comunidad, todo empezó a mitad del 2023, con la necesidad de darle un poco de orden a mi carpeta `Downloads`, con mi conocimientos básico de bash, usando 4 comando (`mkdir`, `mv`, `echo` y `sleep`) pude hacer algo que cubría esa necesidad inicial.

<br>

`ordenarFicheros1.sh` 
   ```bash
#!bin/bash

mkdir TEXTOS
mv *.txt *.pdf *.xlsx *.xlsm *.xlsb *.xltx TEXTOS
echo "***** Archivos enviados a la carpeta TEXTOS *****"

mkdir AUDIOS
mv *.mp3 *.acc *.wav *.wma *.aiff *.ogg AUDIOS
echo "***** Archivos enviados a la carpeta AUDIOS *****"

mkdir VIDEOS
mv *.mp4 *.avi *.mov *.wmv *.avchd *.flv *.f4v *.swf *.webm VIDEOS
echo "***** Archivos enviados a la carpeta VIDEOS *****"

mkdir IMÁGENES
mv *.jpg *.jpge *.png *.gif IMÁGENES
echo "***** Archivos enviados a la carpeta IMÁGENES *****"

mkdir COMPRIMIDOS
mv *.rar *.zip *.7z COMPRIMIDOS
echo "***** Archivos enviados a la carpeta COMPRIMIDOS *****"

mkdir EJECUTABLES
mv *.exe EJECUTABLES
echo "***** Archivos enviados a la carpeta EJECUTABLES *****"

mkdir ISO-IMG
mv *.img *.iso ISO-IMG
echo "***** Archivos enviados a la carpeta ISO-IMG *****"

mkdir OTROS
mv *.xml *.dll OTROS
echo "***** Archivos enviados a la carpeta OTROS *****"

sleep 5
   ``` 

<br>

Ya en la segunda revision se optimizo el código (No mucho) y se agregaron mas formatos a la lista, pero aun carecía con la posibilidad de manejar archivos duplicados.

`Ordenar_Ficheros_v2.sh`
```bash
#!/bin/bash

# Crear directorios si no existen
mkdir -p TEXTOS AUDIOS VIDEOS IMÁGENES COMPRIMIDOS EJECUTABLES ISO-IMG OTROS

# Mover archivos a sus respectivos directorios
mv *.txt *.pdf *.xlsx *.xlsm *.xlsb *.xltx *.xls *.docx *.pptx TEXTOS 2>/dev/null
mv *.mp3 *.acc *.wav *.wma *.aiff *.ogg AUDIOS 2>/dev/null
mv *.mp4 *.avi *.mov *.wmv *.avchd *.flv *.f4v *.swf *.webm VIDEOS 2>/dev/null
mv *.jpg *.jpge *.png *.gif *.webp *.ico *.psd IMÁGENES 2>/dev/null
mv *.rar *.zip *.7z COMPRIMIDOS 2>/dev/null
mv *.exe EJECUTABLES 2>/dev/null
mv *.img *.iso ISO-IMG 2>/dev/null
mv *.xml *.dll *.bin OTROS 2>/dev/null

# Mensaje de salida
echo "***** Archivos organizados correctamente *****"

exit
``` 

A partir del código de lo que nombre `Ordenar_Ficheros_v2.sh` surgió el proyecto [Sort My Downloads](../SortMyDownloads.sh). 