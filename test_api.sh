#!/bin/bash

# Credenciales
USERNAME="goretti"
PASSWORD="gn300803"

# Endpoint base
BASE_URL="http://localhost:8080/actividades"

# Test: GET /actividades
echo "Test: GET /actividades"
response=$(curl -u "$USERNAME:$PASSWORD" -X GET "$BASE_URL")
echo "$response"

# Comprobar si hubo un error de autenticación
if [[ "$response" == *"Unauthorized"* ]]; then
    echo "Error: No autorizado para acceder al endpoint GET /actividades"
fi

# Test: POST /actividades
echo -e "\nTest: POST /actividades"
response=$(curl -u "$USERNAME:$PASSWORD" -X POST "$BASE_URL" -H "Content-Type: application/json" -d '{"nombre": "Nueva Actividad", "descripcion": "Descripción de la nueva actividad"}')
echo "$response"

# Comprobar si hubo un error de autenticación
if [[ "$response" == *"Unauthorized"* ]]; then
    echo "Error: No autorizado para acceder al endpoint POST /actividades"
fi

# Test: PUT /actividades/1
echo -e "\nTest: PUT /actividades/1"
response=$(curl -u "$USERNAME:$PASSWORD" -X PUT "$BASE_URL/1" -H "Content-Type: application/json" -d '{"nombre": "Actividad Modificada", "descripcion": "Descripción modificada de la actividad"}')
echo "$response"

# Comprobar si hubo un error de autenticación
if [[ "$response" == *"Unauthorized"* ]]; then
    echo "Error: No autorizado para acceder al endpoint PUT /actividades/1"
fi

# Test: DELETE /actividades/1
echo -e "\nTest: DELETE /actividades/1"
response=$(curl -u "$USERNAME:$PASSWORD" -X DELETE "$BASE_URL/1")
echo "$response"

# Comprobar si hubo un error de autenticación
if [[ "$response" == *"Unauthorized"* ]]; then
    echo "Error: No autorizado para acceder al endpoint DELETE /actividades/1"
fi
