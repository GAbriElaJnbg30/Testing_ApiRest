#!/bin/bash

# URL de la API
URL="http://api-go:8080/actividades"

# Token de autenticación
TOKEN="4af24fb6-77b4-453b-b750-a3b2771dfde9"

# Método GET
echo "====================="
echo "Probando GET: Obtener actividades"
response=$(curl -s -w "%{http_code}" -o response.json -H "Authorization: Bearer $TOKEN" "$URL")
http_code=$(tail -n1 <<< "$response")  # Extraer código HTTP
if [ "$http_code" -eq 200 ]; then
    echo "GET: Éxito - Código de respuesta HTTP $http_code"
    echo "Contenido de la respuesta:"
    cat response.json
else
    echo "GET: Error - Código de respuesta HTTP $http_code"
fi
echo "====================="

# Método POST
echo "====================="
echo "Probando POST: Crear nueva actividad"
response=$(curl -s -w "%{http_code}" -o /dev/null -X POST -H "Authorization: Bearer $TOKEN" -d '{"nombre":"Nueva Actividad", "descripcion":"Descripción de prueba"}' "$URL")
if [ "$response" -eq 201 ]; then
    echo "POST: Éxito - Código de respuesta HTTP $response"
else
    echo "POST: Error - Código de respuesta HTTP $response"
fi
echo "====================="

# Método PUT
echo "====================="
echo "Probando PUT: Actualizar actividad con ID 2"
response=$(curl -s -w "%{http_code}" -o /dev/null -X PUT -H "Authorization: Bearer $TOKEN" -d '{"nombre":"Actividad Actualizada", "descripcion":"Descripción actualizada"}' "$URL/2")
if [ "$response" -eq 200 ]; then
    echo "PUT: Éxito - Código de respuesta HTTP $response"
else
    echo "PUT: Error - Código de respuesta HTTP $response"
fi
echo "====================="

# Método DELETE
echo "====================="
echo "Probando DELETE: Eliminar actividad con ID 2"
response=$(curl -s -w "%{http_code}" -o /dev/null -X DELETE -H "Authorization: Bearer $TOKEN" "$URL/2")
if [ "$response" -eq 204 ]; then
    echo "DELETE: Éxito - Código de respuesta HTTP $response"
else
    echo "DELETE: Error - Código de respuesta HTTP $response"
fi
echo "====================="
