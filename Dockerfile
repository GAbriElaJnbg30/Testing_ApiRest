# Usa una imagen oficial de Go
FROM golang:1.20

# Establece el directorio de trabajo
WORKDIR /app

# Copia el archivo go.mod y go.sum y descarga las dependencias
COPY go.mod ./
RUN go mod download

# Copia el resto del código
COPY . .

# Compila el programa
RUN go build -o main .

# Define el puerto
EXPOSE 8080

# Ejecuta el binario
CMD ["./main"]
