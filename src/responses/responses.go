package responses

import (
	"encoding/json"
	"log"
	"net/http"
)

func JSON(w http.ResponseWriter, status_code int, datas interface{}){
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(status_code)

	if datas != nil{
		if err := json.NewEncoder(w).Encode(datas); err != nil{
			log.Fatal(err)
		}
	}
}

func Err(w http.ResponseWriter, status_code int, err error){
	JSON(w, status_code, struct{
		Err string `json:"erro"`
	}{
		Err:err.Error(),
	})
}