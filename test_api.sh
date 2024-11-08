#!/bin/bash

# URL de la API
URL="http://localhost:8080"

# Función para verificar respuestas HTTP
check_response() {
  if [[ "$1" -eq "$2" ]]; then
    echo "✅ Prueba pasada para $3"
  else
    echo "❌ Prueba fallida para $3"
    exit 1
  fi
}

# Prueba: Obtener todas las actividades
echo "Prueba: GET /actividades"
response=$(curl -s -o /dev/null -w "%{http_code}" "$URL/actividades")
check_response $response 200 "GET /actividades"

# Prueba: Crear una nueva actividad
echo "Prueba: POST /actividades"
response=$(curl -s -o /dev/null -w "%{http_code}" -X POST "$URL/actividades" \
  -H "Content-Type: application/json" \
  -d '{"nombre": "Nueva Actividad", "descripcion": "Prueba de creación"}')
check_response $response 201 "POST /actividades"

#echo "Prueba: POST /actividades"
#curl -X POST "$URL/actividades" \
#  -H "Content-Type: application/json" \
#  -d '{"nombre": "Nueva Actividad", "descripcion": "Prueba de creación"}' -v


# Prueba: Actualizar una actividad existente
echo "Prueba: PUT /actividades/1"
response=$(curl -s -o /dev/null -w "%{http_code}" -X PUT "$URL/actividades/1" \
  -H "Content-Type: application/json" \
  -d '{"nombre": "Actividad Actualizada", "descripcion": "Prueba de actualización"}')
check_response $response 200 "PUT /actividades/1"

# Prueba: Eliminar una actividad
echo "Prueba: DELETE /actividades/1"
response=$(curl -s -o /dev/null -w "%{http_code}" -X DELETE "$URL/actividades/1")
check_response $response 204 "DELETE /actividades/1"
