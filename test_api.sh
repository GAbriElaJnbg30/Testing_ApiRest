#!/bin/bash

# Credenciales
USERNAME="goretti"
PASSWORD="gn300803"

# Endpoint base
BASE_URL="http://localhost:8080/actividades"

# Test: GET /actividades
echo "Test: GET /actividades"
curl -u "$USERNAME:$PASSWORD" -X GET "$BASE_URL"

# Test: POST /actividades
echo -e "\nTest: POST /actividades"
curl -u "$USERNAME:$PASSWORD" -X POST "$BASE_URL" -H "Content-Type: application/json" -d '{"nombre": "Nuevo Actividad", "descripcion": "Descripción de la nueva actividad"}'

# Test: PUT /actividades/1
echo -e "\nTest: PUT /actividades/1"
curl -u "$USERNAME:$PASSWORD" -X PUT "$BASE_URL/1" -H "Content-Type: application/json" -d '{"nombre": "Actividad Modificada", "descripcion": "Descripción modificada de la actividad"}'

# Test: DELETE /actividades/1
echo -e "\nTest: DELETE /actividades/1"
curl -u "$USERNAME:$PASSWORD" -X DELETE "$BASE_URL/1"
