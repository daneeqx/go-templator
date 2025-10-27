FROM golang:{{cookiecutter.go_version}}-alpine

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN go build -o {{cookiecutter.domain}} cmd/{{cookiecutter.domain}}/main.go

EXPOSE 8080
CMD ["./{{cookiecutter.domain}}"]

