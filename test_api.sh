#!/bin/bash

# Prueba del endpoint GET /actividades
response=$(curl -u "goretti:gn300803" -s -o /dev/null -w "%{http_code}" "http://localhost:8080/actividades")

if [ "$response" -eq 200 ]; then
    echo "Test: GET /actividades: Passed (Status Code: $response)"
else
    echo "Test: GET /actividades: Failed (Status Code: $response)"
    exit 1
fi
