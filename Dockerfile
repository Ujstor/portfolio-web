FROM golang:1.22-alpine as base

RUN apk add --no-cache make

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

FROM base as dev
RUN make build
EXPOSE 5000
CMD [ "sh", "-c", "echo 'y' | make watch" ]

FROM base as build
RUN make build

FROM alpine:3.20.1 as prod
WORKDIR /app
COPY --from=build /app/main /app/main
EXPOSE 5000
CMD ["./main"]
