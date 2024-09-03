package routes

import (
	"net/http"
	"tournament-management/src/controllers"
)

var player_routes = []Route{
	{
		URI: "/player",
		Method: http.MethodPost,
		Function: controllers.Registering_new_player,
		Need_Autentication: false,
	},
}