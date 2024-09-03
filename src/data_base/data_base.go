package data_base

import (
	"database/sql"

	_ "github.com/go-sql-driver/mysql"
)

func Connect_db() (*sql.DB, error){
	db, err := sql.Open("mysql", "******:******@/tournament_management?charset=utf8&parseTime=True&loc=Local")
	if err != nil{
		return nil, err
	}

	if err = db.Ping(); err != nil{
		return nil, err
	}

	return db, nil
}