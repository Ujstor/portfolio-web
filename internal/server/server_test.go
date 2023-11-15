package server

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

// Checks if a new FiberServer instance is correctly created
func TestNewFiberServer(t *testing.T) {
	server := New()

	assert.NotNil(t, server, "FiberServer instance should not be nil")
	assert.IsType(t, &FiberServer{}, server, "New should return an instance of *FiberServer")
	assert.NotNil(t, server.App, "Fiber App in FiberServer should not be nil")
}
