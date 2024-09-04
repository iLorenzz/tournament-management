package controllers

import (
	"encoding/json"
	"io"
	"net/http"
	"tournament-management/src/data_base"
	"tournament-management/src/models"
	"tournament-management/src/repositories"
	"tournament-management/src/responses"
)

func Registering_new_player(w http.ResponseWriter, r *http.Request){
	request_body, err := io.ReadAll(r.Body)
	if err != nil {
		responses.Err(w, http.StatusUnprocessableEntity, err)
		return
	}

	var player models.Player

	if err = json.Unmarshal(request_body, &player); err != nil{
		responses.Err(w, http.StatusBadRequest, err)
		return
	}

	db, err := data_base.Connect_db()
	if err != nil{
		responses.Err(w, http.StatusInternalServerError, err)
		return
	}
	defer db.Close()

	repository := repositories.New_repository_of_player(db)
	player.ID, err = repository.Create_player(player)
	if err != nil{
		responses.Err(w, http.StatusInternalServerError, err)
		return
	}

	responses.JSON(w, http.StatusCreated, player)
}

func Updating_player_informations(w http.ResponseWriter, r *http.Request){
	request_body, err := io.ReadAll(r.Body) 
	if err != nil{
		responses.Err(w, http.StatusInternalServerError, err)
		return
	}

	var player models.Player
	if err = json.Unmarshal(request_body, &player); err != nil{
		responses.Err(w, http.StatusBadRequest, err)
		return
	}

	db, err := data_base.Connect_db()
	if err != nil{
		responses.Err(w, http.StatusInternalServerError, err)
		return
	}

	defer db.Close()

	repository := repositories.New_repository_of_player(db)
	err = repository.Update_player(player.ID, player)
	if err != nil{
		responses.Err(w, http.StatusInternalServerError, err)
	}

	responses.JSON(w, http.StatusNoContent, err)
	
}