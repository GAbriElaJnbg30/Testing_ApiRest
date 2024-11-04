#!/bin/bash

# Endpoint base
BASE_URL="http://localhost:8080/actividades"

# Test: GET /actividades
echo "Test: GET /actividades"
response=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL")
if [[ "$response" -eq 200 ]]; then
    echo "GET /actividades: OK (Status Code: $response)"
else
    echo "GET /actividades: Failed (Status Code: $response)"
fi
