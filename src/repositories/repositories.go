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

func (repository Player) Create_player(player models.Player) (uint64, error){
	statement, err := repository.db.Prepare(`
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

func (repository Player) Update_player(ID uint64, player models.Player) (error){
	statement, err := repository.db.Prepare(
		"update player set player_nick = ?, email = ?, cell_phone = ? where player_id = ?",
	)
	if err != nil{
		return err
	}
	defer statement.Close()

	if _, err = statement.Exec(player.Nick, player.Email, player.Cell_phone, ID);
	err != nil{
		return err
	}

	return nil
}

func (repository Player) Join_player_to_tournament(ID uint64, player models.Player) (error){
	statement, err := repository.db.Prepare(
		"update player set tournament_id = ? where = player_id = ?",
	)
	if err != nil{
		return err
	}
	defer statement.Close()

	if _, err = statement.Exec(player.Tournament, ID);
	err != nil{
		return err
	}

	return nil
}