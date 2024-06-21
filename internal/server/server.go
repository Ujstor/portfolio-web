package server

import (
	"fmt"
	"net/http"
	"time"
)

type Server struct {
	port int
}

func NewServer() *http.Server {
	NewServer := &Server{
		port: 5000,
	}

	// Declare Server config
	server := &http.Server{
		Addr:         fmt.Sprintf(":%d", NewServer.port),
		Handler:      NewServer.RegisterRoutes(),
		IdleTimeout:  time.Minute,
		ReadTimeout:  10 * time.Second,
		WriteTimeout: 30 * time.Second,
	}

	return server
}
