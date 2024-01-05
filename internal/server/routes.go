package server

import (
	"github.com/gofiber/fiber/v2"
)

func (s *FiberServer) RegisterFiberRoutes() {
	s.App.Static("/", "./cmd/web/templates")

	s.App.Static("/static", "./cmd/web/static")

	// 404 handler for all other routes
	s.App.Use(func(c *fiber.Ctx) error {
		if c.Path() != "/" && c.Path() != "/static" {
			return fiber.ErrNotFound
		}
		return c.Next()
	})
}
