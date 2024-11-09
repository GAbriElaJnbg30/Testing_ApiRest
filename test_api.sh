#!/bin/bash

# URL de la API
URL="http://localhost:8080"

TOKEN="4af24fb6-77b4-453b-b750-a3b2771dfde9"

# Realiza la solicitud GET a /actividades
response=$(curl -s -w "%{http_code}" -o response_body.txt "$URL/actividades" \
  -H "Authorization: Bearer $TOKEN")

# Extrae el código de respuesta HTTP
http_code=$(echo "$response" | tail -n1)

# Verifica si el código de respuesta es 200 (OK)
if [ "$http_code" -eq 200 ]; then
    echo "Prueba exitosa para GET /actividades"
    echo "Respuesta completa:"
    cat response_body.txt
else
    echo "Prueba fallida para GET /actividades"
    echo "Código de respuesta HTTP: $http_code"
    echo "Contenido de la respuesta:"
    cat response_body.txt
    exit 1  # Termina con un error si el código no es 200
fi