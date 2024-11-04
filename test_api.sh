#!/bin/bash

# Credenciales
USERNAME="goretti"
PASSWORD="gn300803"

# Endpoint base
BASE_URL="http://localhost:8080/actividades"

# Test: GET /actividades
echo "Test: GET /actividades"
response=$(curl -u "$USERNAME:$PASSWORD" -s -o /dev/null -w "%{http_code}" "$BASE_URL")
if [[ "$response" -eq 200 ]]; then
    echo "GET /actividades: OK (Status Code: $response)"
else
    echo "GET /actividades: Failed (Status Code: $response)"
fi
