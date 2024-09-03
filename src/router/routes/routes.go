package routes

import (
	"net/http"

	"github.com/gorilla/mux"
)

type Route struct{
	URI						string
	Method					string
	Function				func(http.ResponseWriter, *http.Request)
	Need_Autentication 		bool
}

func Routes_configuration(r *mux.Router) *mux.Router{
	routes := player_routes

	for _, route := range routes{
		r.HandleFunc(route.URI, route.Function).Methods(route.Method)
	}

	return r
}

