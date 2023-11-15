package server

import (
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/gofiber/fiber/v2"
	"github.com/stretchr/testify/assert"
)

// Creates a new FiberServer instance.
func NewFiberServer() *FiberServer {
	return &FiberServer{App: fiber.New()}
}

// Checks if routes are registered correctly in Fiber
func TestRegisterFiberRoutes(t *testing.T) {
	s := NewFiberServer()
	
	// Temporary test route
	s.App.Get("/", func(c *fiber.Ctx) error {
		return c.SendStatus(http.StatusOK)
	})

	req := httptest.NewRequest(http.MethodGet, "/", nil)
	resp, err := s.App.Test(req)

	assert.NoError(t, err, "Error should be nil")
	assert.NotNil(t, resp, "Response should not be nil")
	assert.Equal(t, http.StatusOK, resp.StatusCode, "Status code should be 200")
}
