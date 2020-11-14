package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

const helloWorld = "Hello, World!"

func handler(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte(helloWorld))
	fmt.Println(helloWorld)
}

func main() {
	http.HandleFunc("/", handler)
	port := os.Getenv("PORT")
	addr := fmt.Sprintf(":%s", port)
	log.Fatal(http.ListenAndServe(addr, nil))
}
