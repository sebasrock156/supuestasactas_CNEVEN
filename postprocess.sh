# Este es un script de postprocesado, se encarga de comprimir las imágenes de las actas -->
# (no sé con qué motivo, supongo que para "optimizarlas" cuando no es necesario en Github)


cp actas_raw/** actas
#Copia las imágenes (se supone que en crudo) a la carpeta "actas"

cd actas
# Nos lleva a la carpeta "actas" con el comando "Change Directory"

for file in *.jpg; do
  if [ -f "$file" ]; then
    echo "Processing $file"
    jpegoptim --size=85k $file
  fi
done
# Es un ciclo que hace un proceso de compresión en formato .jpeg


cd ..
