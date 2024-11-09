package main

import (
	"bytes"
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"testing"
)

// Test para GET /actividades
func TestGetActividades(t *testing.T) {
	req, err := http.NewRequest("GET", "/actividades", nil)
	if err != nil {
		t.Fatal(err)
	}

	rr := httptest.NewRecorder()
	handler := http.HandlerFunc(getActividades)
	handler.ServeHTTP(rr, req)

	if status := rr.Code; status != http.StatusOK {
		t.Errorf("handler devolvió estado incorrecto: obtuvo %v, quería %v",
			status, http.StatusOK)
	}

	expected := `[]` // Ajusta esto según el contenido esperado
	if rr.Body.String() != expected {
		t.Errorf("handler devolvió cuerpo inesperado: obtuvo %v, quería %v",
			rr.Body.String(), expected)
	}
}

// Test para POST /actividades
func TestCreateActividad(t *testing.T) {
	nuevaActividad := &Actividad{
		Nombre:      "Test Actividad",
		Descripcion: "Descripción de Test",
	}
	body, err := json.Marshal(nuevaActividad)
	if err != nil {
		t.Fatal(err)
	}

	req, err := http.NewRequest("POST", "/actividades", bytes.NewBuffer(body))
	if err != nil {
		t.Fatal(err)
	}
	req.Header.Set("Content-Type", "application/json")

	rr := httptest.NewRecorder()
	handler := http.HandlerFunc(createActividad)
	handler.ServeHTTP(rr, req)

	if status := rr.Code; status != http.StatusCreated {
		t.Errorf("handler devolvió estado incorrecto: obtuvo %v, quería %v",
			status, http.StatusCreated)
	}

	var actividad Actividad
	if err := json.NewDecoder(rr.Body).Decode(&actividad); err != nil {
		t.Fatal(err)
	}

	if actividad.Nombre != nuevaActividad.Nombre {
		t.Errorf("handler devolvió nombre incorrecto: obtuvo %v, quería %v",
			actividad.Nombre, nuevaActividad.Nombre)
	}
}

func TestUpdateActividad(t *testing.T) {
	updatedActividad := &Actividad{
		Nombre:      "Actividad Actualizada",
		Descripcion: "Descripción Actualizada",
	}
	body, err := json.Marshal(updatedActividad)
	if err != nil {
		t.Fatal(err)
	}

	req, err := http.NewRequest("PUT", "/actividades/1", bytes.NewBuffer(body)) // Ajusta el ID según tu caso
	if err != nil {
		t.Fatal(err)
	}
	req.Header.Set("Content-Type", "application/json")

	rr := httptest.NewRecorder()
	handler := http.HandlerFunc(updateActividad)
	handler.ServeHTTP(rr, req)

	if status := rr.Code; status != http.StatusOK {
		t.Errorf("handler devolvió estado incorrecto: obtuvo %v, quería %v",
			status, http.StatusOK)
	}

	var actividad Actividad
	if err := json.NewDecoder(rr.Body).Decode(&actividad); err != nil {
		t.Fatal(err)
	}

	if actividad.Nombre != updatedActividad.Nombre {
		t.Errorf("handler devolvió nombre incorrecto: obtuvo %v, quería %v",
			actividad.Nombre, updatedActividad.Nombre)
	}
}

func TestDeleteActividad(t *testing.T) {
	req, err := http.NewRequest("DELETE", "/actividades/1", nil) // Ajusta el ID según tu caso
	if err != nil {
		t.Fatal(err)
	}

	rr := httptest.NewRecorder()
	handler := http.HandlerFunc(deleteActividad)
	handler.ServeHTTP(rr, req)

	if status := rr.Code; status != http.StatusNoContent {
		t.Errorf("handler devolvió estado incorrecto: obtuvo %v, quería %v",
			status, http.StatusNoContent)
	}
}

// Puedes añadir más tests para los endpoints PUT y DELETE de manera similar
