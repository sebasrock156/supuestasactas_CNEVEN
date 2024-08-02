#!/bin/bash

# Hago un resumen general: Se supone que este código debería de generar un número aleatorio como cédula
# para mostrar cualquiera de las actas (lo que me parece terrible y hubiera sido mucho más fácil agregando una consulta).
# Me parece terrible porque, por números al azar, jamás se podría consultar una mesa/puesto de votación específico

if [ "$#" -ne 3 ]; then
  echo "You must enter exactly 3 numbers as arguments."
  exit 1
fi

amount=$1
min=$2
max=$3


for (( i=0; i<=amount; i++ ))
do
    random_number=$(( ( RANDOM * 32768 + RANDOM ) % (max - min + 1) + min ))
    # base_url="https://gdp.sicee-api.net/api/Search/SearchCNEPointsByCid"
    base_url="https://tvtcrhau2vo336qa5r66p3bygy0hazyk.lambda-url.us-east-1.on.aws/?cedula=V${random_number}"
    
# Dato curioso: La URL usada como base de datos no está disponible para ser consultada, aparte, el código tiene una base de datos interna.
    
    
    response=$(curl -s "$base_url" --data '{ cid: "V14567876" }' )

    url=$(echo "$response" | jq -r '.url')
    
    if [ "$url" != "null" ]; then
        filename=$(basename $url)
        echo "Data found for V$random_number at $filename"
        curl -s "$url" --output "./actas_raw/$filename"
        
# Justamente aquí deberia de hacerse una consulta entre la URL y el número random, lanzándonos las actas en crudo
# La cuestión es que ya hay predefinido un valor de consulta como cédula para el "experimento", curioso.

    fi
done
