FROM golang:1.22-alpine as build

RUN apk add --no-cache make

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN go install github.com/a-h/templ/cmd/templ@latest
RUN templ generate
RUN go build -o main cmd/api/main.go

FROM alpine:3.20.1 as prod
WORKDIR /app
COPY --from=build /app/main /app/main
EXPOSE 5000
CMD ["./main"]
