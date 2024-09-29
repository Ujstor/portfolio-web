FROM golang:1.22-alpine AS base

RUN apk add --no-cache make

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

FROM base AS dev
RUN make build
EXPOSE 5000
CMD [ "sh", "-c", "echo 'y' | make watch" ]

FROM base AS build
RUN make build

FROM alpine:3.20.1 AS prod
WORKDIR /app
COPY --from=build /app/main /app/main
EXPOSE 5000
CMD ["./main"]
