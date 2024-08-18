use tournament

drop table if exists player cascade;

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

drop table if exists tournament cascade;

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

drop table if exists league cascade;

create table league(
    foreign key (tournament_id) references tournament(tournament_id),
    primary key (tournament_id)
)engine=innodb;

drop table if exists ranked cascade;

create table ranked(
    foreign key (tournament_id) references tournament(tournament_id),
    primary key(tournament_id)
)engine=innodb;

drop table if exists eliminatory cascade;

create table eliminatory(
    foreign key (tournament_id) references tournament(tournament_id),
    primary key(tournament_id)
)engine=innodb;

drop table if exists team cascade;

create table team(
    team_id int auto_increment primary key,
    team_name varchar(50) not null
)engine=innodb;

drop table if exists match_table cascade;

create table match_table(
    match_table_id int auto_increment primary key
)engine=innodb;

drop table if exists players_match cascade;

create table players_match(
    constraint player1 
    foreign key (player_id) references player(player_id),
    constraint player2 
    foreign key (player_id) references player(player_id),
    player_match_date date not null,
    player_match_hour varchar(7) not null,
    time_match varchar(20),
    foreign key (tournament_id) references tournament(tournament_id),
    foreign key (brackt_id) references bracket(bracket_id),
    fase varchar(15),
    foreign key (match_table_id) references match_table(match_table_id),
    constraint player_winner 
    foreign key (player_id) references player(player_id),
    primary key(player1, player2)
)engine=innodb;

drop table if exists teams_match cascade;

create table teams_match(
    constraint team1 
    foreign key (team_id) references team(team_id),
    constraint team2 
    foreign key (team_id) references team(team_id),
    team_match_date date not null,
    team_match_hour varchar(7) not null,
    time_match varchar(20),
    foreign key (tournament_id) references tournament(tournament_id),
    foreign key (brackt_id) references bracket(bracket_id),
    fase varchar(15),
    foreign key (match_table_id) references match_table(match_table_id),
    constraint team_winner 
    foreign key (team_id) references team(team_id),
    primary key(team1, team2)
)engine=innodb;