package repositories

import (
	"database/sql"
	"tournament-management/src/models"
)

type Player struct{
	db *sql.DB
}

func New_repository_of_player(db *sql.DB) *Player{
	return &Player{db}
}

func (repositories Player) Create_player(player models.Player) (uint64, error){
	statement, err := repositories.db.Prepare(`
		insert into player
		(player_id, player_name, player_las_name, cpf, email, cell_phone, birth_date, tournament_id, team_id, statics)
		values(?, ?, ?, ?, ?, ?, ? , ?, ?, ?)`,
	)
	if err != nil{
		return 0, err
	}

	defer statement.Close()

	result, err := statement.Exec(player.Name, player.Last_name, player.Nick, player.Cpf,
		player.Email, player.Cell_phone, player.Birth_date, player.Tournament, player.Team, 
		player.Statics)
	if err != nil{
		return 0, err
	}

	last_inserted_id, err := result.LastInsertId()
	if err != nil{
		return 0, err
	}

	return uint64(last_inserted_id), nil
	
}