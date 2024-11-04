pipeline {
    agent any

    stages {
        stage('Test API') {
            steps {
                script {
                    // Verificar que la API está corriendo
                    def response = sh(script: 'curl -s -o /dev/null -w "%{http_code}" http://localhost:8080/actividades', returnStdout: true).trim()
                    if (response != '200') {
                        error "API no está disponible. Código de respuesta: ${response}"
                    } else {
                        echo "API está disponible. Código de respuesta: ${response}"
                    }

                    // Crear una nueva actividad
                    def nuevaActividadJson = '{"nombre": "Actividad de prueba", "descripcion": "Descripción de prueba"}'
                    def createResponse = sh(script: "curl -s -X POST -H 'Content-Type: application/json' -d '${nuevaActividadJson}' http://localhost:8080/actividades", returnStdout: true)
                    echo "Respuesta de crear actividad: ${createResponse}"

                    def createdActividad = readJSON(text: createResponse)
                    echo "Actividad creada con ID: ${createdActividad.id}"

                    // Obtener todas las actividades
                    def getResponse = sh(script: 'curl -s http://localhost:8080/actividades', returnStdout: true)
                    echo "Respuesta de obtener actividades: ${getResponse}"

                    // Verificar que la actividad creada esté en la lista
                    def actividades = readJSON(text: getResponse)
                    def actividadCreada = actividades.find { it.id == createdActividad.id }
                    if (actividadCreada == null) {
                        error "La actividad creada no se encontró en la lista de actividades."
                    } else {
                        echo "La actividad creada se encontró correctamente: ${actividadCreada.nombre}"
                    }

                    // Actualizar la actividad
                    def updateActividadJson = '{"nombre": "Actividad actualizada", "descripcion": "Descripción actualizada"}'
                    def updateResponse = sh(script: "curl -s -X PUT -H 'Content-Type: application/json' -d '${updateActividadJson}' http://localhost:8080/actividades/${createdActividad.id}", returnStdout: true)
                    echo "Respuesta de actualizar actividad: ${updateResponse}"

                    // Eliminar la actividad
                    def deleteResponse = sh(script: "curl -s -X DELETE http://localhost:8080/actividades/${createdActividad.id}", returnStdout: true)
                    echo "Respuesta de eliminar actividad: ${deleteResponse}"

                    // Verificar que la actividad ya no está
                    def checkResponse = sh(script: 'curl -s http://localhost:8080/actividades', returnStdout: true)
                    def actividadesDespuésEliminación = readJSON(text: checkResponse)
                    if (actividadesDespuésEliminación.find { it.id == createdActividad.id }) {
                        error "La actividad no fue eliminada correctamente."
                    } else {
                        echo "La actividad fue eliminada correctamente."
                    }
                }
            }
        }
    }
}
