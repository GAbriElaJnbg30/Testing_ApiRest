FROM golang 

# donde se encontrara el codigo de nuestra aplicacion dentro del contenedor
WORKDIR /api-rest

COPY go.mod ./
COPY go.sum ./
COPY .env ./
RUN go mod download

COPY *go ./

RUN go build -o /api

EXPOSE 8080

CMD ["/api"]