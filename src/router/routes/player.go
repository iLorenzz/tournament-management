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

	{
		URI:"/player/{playerId}",
		Method: http.MethodPost,
		Function: controllers.Updating_player_informations,
		Need_Autentication: false,
	},

	{
		URI:"/player/tournaments/{playerId}",
		Method: http.MethodPost,
		Function: controllers.Add_player_to_new_tournament,
		Need_Autentication: false,
	},
}