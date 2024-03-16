FROM golang:1.22-alpine as base

RUN apk add --no-cache make

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

FROM base as dev
RUN make build
EXPOSE ${PORT}
CMD [ "sh", "-c", "echo 'y' | make watch" ]

FROM base as build
RUN go build -o main cmd/api/main.go

FROM alpine:3.19.0 as prod
WORKDIR /app
COPY --from=build /app/main /app/main
COPY cmd/web cmd/web
EXPOSE ${PORT}
CMD ["./main"]