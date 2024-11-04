#!/bin/bash

# URL base de la API
BASE_URL="http://localhost:8080/actividades"

echo "Test: GET /actividades"
curl -s -X GET "$BASE_URL" -H "Content-Type: application/json"
echo -e "\n"

echo "Test: POST /actividades"
curl -s -X POST "$BASE_URL" -H "Content-Type: application/json" -d '{
    "nombre": "Correr",
    "descripcion": "Ejercicio matutino"
}'
echo -e "\n"

echo "Test: PUT /actividades/1"
curl -s -X PUT "$BASE_URL/1" -H "Content-Type: application/json" -d '{
    "nombre": "Correr",
    "descripcion": "Ejercicio diario"
}'
echo -e "\n"

echo "Test: DELETE /actividades/1"
curl -s -X DELETE "$BASE_URL/1" -H "Content-Type: application/json"
echo -e "\n"
