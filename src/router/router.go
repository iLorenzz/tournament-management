package router

import (
	"tournament-management/src/router/routes"

	"github.com/gorilla/mux"
)



func Generate() *mux.Router{
	r := mux.NewRouter()
	
	return routes.Routes_configuration(r)
}