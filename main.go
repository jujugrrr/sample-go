package main

import (
  "fmt"
  "time"
  "net/http"
  "os"
)

func handler(w http.ResponseWriter, r *http.Request) {
  h, _ := os.Hostname()
  fmt.Fprintf(w, "Hi there, I'm served from %s, at %s!", h, time.Now())
}

func main() {
  http.HandleFunc("/", handler)
  http.ListenAndServe(":8484", nil)
}
