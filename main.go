package main

import (
    "fmt"
    "net/http"
    "os"
    "path/filepath"
	"strings"
)

func main() {
    // Handle requests for the root path ("/")
    http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
        // Check if the request path is exactly "/"
        if r.URL.Path != "/" {
            // If the path is not "/", return a 404 error
            http.NotFound(w, r)
            return
        }

        // Serve the root HTML file
        http.ServeFile(w, r, "web/index.html")
    })

    // Serve static assets (CSS, fonts, images, and JavaScript)
    fs := http.FileServer(http.Dir("web"))
    http.Handle("/web/", http.StripPrefix("/web/", fs))

    // Serve all files within the "/web/doc/" directory
    docDir := "./web/doc/"
    http.HandleFunc("/web/doc/", func(w http.ResponseWriter, r *http.Request) {
        // Extract the requested file name from the URL path
        fileRequested := r.URL.Path[len("/web/doc/"):]
        // Construct the full file path
        fullPath := filepath.Join(docDir, fileRequested)

        // Check if the file exists
        _, err := os.Stat(fullPath)
        if err != nil {
            // File not found, return a 404 error
            http.NotFound(w, r)
            return
        }

        // Serve the requested file
        http.ServeFile(w, r, fullPath)
    })

    port := 8080
    fmt.Printf("Server listening on port %d...\n", port)
    addr := fmt.Sprintf(":%d", port)

    // Use a custom NotFound handler for any other requests
    http.ListenAndServe(addr, http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {

        if r.URL.Path != "/" && !strings.HasPrefix(r.URL.Path, "/web/doc/") {
            http.Redirect(w, r, "/404", http.StatusFound)
            return
        }

        http.DefaultServeMux.ServeHTTP(w, r)
    }))
}
