package main

import (
	"fmt"
	"net/http"
)

func main() {
	// Handle requests for static assets (CSS, fonts, images, and JavaScript)
	fs := http.FileServer(http.Dir("assets"))
	http.Handle("/assets/", http.StripPrefix("/assets/", fs))

	// Handle requests for the root path ("/")
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		http.ServeFile(w, r, "index.html")
	})

	port := 8080
	fmt.Printf("Server listening on port %d...\n", port)
	addr := fmt.Sprintf(":%d", port)
	http.ListenAndServe(addr, nil)
}
