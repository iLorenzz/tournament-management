package main

import (
	"log"
	"net/http"
	"tournament-management/src/router"
)

func main(){
	r := router.Generate()

	log.Fatal(http.ListenAndServe(":8000", r))
}