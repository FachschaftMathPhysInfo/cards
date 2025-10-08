# syntax=docker/dockerfile:1

FROM golang:1.21.3

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY graph ./graph
COPY utils ./utils
COPY *.go ./

RUN CGO_ENABLED=1 GOOS=linux go build -o /graphql server.go

CMD ["/graphql"]