#!/bin/bash

# URL de la API
URL="http://localhost:8080"

# Token de autenticación
TOKEN="4af24fb6-77b4-453b-b750-a3b2771dfde9"

# Función para verificar respuestas HTTP
check_response() {
  if [[ "$1" -eq "$2" ]]; then
    echo "✅ Prueba pasada para $3"
  else
    echo "❌ Prueba fallida para $3"
    echo "Código de respuesta HTTP: $1"
    exit 1
  fi
}

# Prueba: GET /actividades con token
echo "Prueba: GET /actividades"
response=$(curl -s -w "%{http_code}" -o response_body.txt "$URL/actividades" \
  -H "Authorization: Bearer $TOKEN")
echo "Respuesta completa: $(cat response_body.txt)"

# Verificar que la respuesta es 200 (OK)
check_response $(echo $response | tail -n 1) 200 "GET /actividades"
