#!/bin/bash

# URL de la API
URL="http://localhost:8080"

TOKEN="4af24fb6-77b4-453b-b750-a3b2771dfde9"

# Prueba: GET /actividades con token
response=$(curl -s -w "%{http_code}" -o response_body.txt "$URL/actividades" \
  -H "Authorization: Bearer $TOKEN")
