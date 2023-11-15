package main

import (
	"fiber/internal/server"
)

func main() {

	server := server.New()

	server.RegisterFiberRoutes()

	err := server.Listen(":5000")
	if err != nil {
		panic("cannot start server")
	}
}
