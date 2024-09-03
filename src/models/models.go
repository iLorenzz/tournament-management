package models

type Player struct{
	ID uint64 `json:"player_id,omitempty"`
	Name string `json:"player_name,omitempty"`
	Last_name string `json:"player_last_name,omitempty"`
	Nick string `json:"player_nick,omitempty"`
	Cpf string `json:"cpf,omitempty"`
	Email string `json:"email,omitempty"`
	Cell_phone string `json:"cell_phone,omitempty"`
	Birth_date string `json:"birth_date,omitempty"`
	Tournament int `json:"tournament_id,omitempty"`
	Team int `json:"team_id,omitempty"`
	Statics string `json:"statics,omitempty"`
}