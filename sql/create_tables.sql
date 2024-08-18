use tournament

drop table if exists player;

create table player(
    player_id int auto_increment primary key,
    player_name varchar(50) not null,
    player_last_name varchar(100) not null,
    player_nick varchar(75) not null,
    cpf varchar(11) not null unique,
    email varchar(100) not null unique,
    cell_phone varchar(14) not null unique,
    bith_date date not null,
    constraint current_tournament 
    foreign key (tournament_id) references tournament(tournament_id)
    statics varchar(50),
    constraint team
    foreign key (team_id) references team(team_id)
)engine=innodb;

drop table if exists tournament;

create table tournament(
    tournament_id int auto_increment primary key,
    tournament_name varchar(30) not null,
    max_players_num int not null,
    game varchar(200) not null,
    tournament_type varchar(50) not null,
    tournament_victory_weigth float(2) not null,
    constraint player_winner 
    foreign key (player_id) references player(player_id),
    constraint team_winner
    foreign key (team_id) references team(team_id)
)engine=innodb;