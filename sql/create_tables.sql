use tournament



create table player(
    player_id int auto_increment primary key,
    player_name varchar(50) not null,
    player_last_name varchar(100) not null,
    player_nick varchar(75) not null,
    cpf varchar(11) not null unique,
    email varchar(100) not null unique,
    cell_phone varchar(14) not null unique,
    bith_date date not null,
    tournament_id int,
    team_id int,
    statics varchar(50),
    foreign key (team_id) references team(team_id)
    on delete cascade
)engine=innodb;

alter table player 
add foreign key (tournament_id) references tournament(tournament_id)
on delete cascade;

alter table player
add points int;

drop table if exists tournament;

create table tournament(
    tournament_id int auto_increment primary key,
    tournament_name varchar(30) not null,
    max_players_num int not null,
    game varchar(200) not null,
    tournament_type varchar(50) not null,
    tournament_victory_weigth float(2) not null,
    player_id int,
    team_id int, 
    foreign key (player_id) references player(player_id)
    on delete cascade,
    foreign key (team_id) references team(team_id)
    on delete cascade
)engine=innodb;

drop table if exists league;

/*create table league(
    tournament_id int,
    foreign key (tournament_id) references tournament(tournament_id)
    on delete cascade,
    primary key (tournament_id)
)engine=innodb;

drop table if exists ranked cascade;

create table ranked(
    tournament_id int,
    foreign key (tournament_id) references tournament(tournament_id)
    on delete cascade,
    primary key(tournament_id)
)engine=innodb;

drop table if exists eliminatory cascade;

create table eliminatory(
    tournament_id,
    foreign key (tournament_id) references tournament(tournament_id)
    on delete cascade,
    primary key(tournament_id)
)engine=innodb;*/

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
    player1 int,
    constraint player1 
    foreign key (player1) references player(player_id)
    on delete cascade,

    player2 int,
    constraint player2 
    foreign key (player2) references player(player_id)
    on delete cascade,

    player_match_date date not null,
    player_match_hour varchar(7) not null,
    time_match varchar(20),
    
    tournament_id int,
    foreign key (tournament_id) references tournament(tournament_id)
    on delete cascade,

    bracket_id int,
    foreign key (bracket_id) references bracket(bracket_id)
    on delete cascade,

    fase varchar(15),

    match_table_id int,
    foreign key (match_table_id) references match_table(match_table_id)
    on delete cascade,

    player_winner int,
    constraint player_winner 
    foreign key (player_winner) references player(player_id),
    primary key(player1, player2)
)engine=innodb;

drop table if exists teams_match cascade;

create table teams_match(
    team1 int,
    constraint team1 
    foreign key (team1) references team(team_id)
    on delete cascade,

    team2 int,
    constraint team2 
    foreign key (team2) references team(team_id)
    on delete cascade,

    team_match_date date not null,
    team_match_hour varchar(7) not null,
    time_match varchar(20),

    tournament_id int,
    foreign key (tournament_id) references tournament(tournament_id)
    on delete cascade,

    bracket_id int,
    foreign key (bracket_id) references bracket(bracket_id)
    on delete cascade,

    fase varchar(15),

    match_table_id int,
    foreign key (match_table_id) references match_table(match_table_id)
    on delete cascade,

    team_winner int,
    constraint team_winner 
    foreign key (team_winner) references team(team_id)
    on delete cascade,

    primary key(team1, team2)
)engine=innodb;

drop table if exists bracket cascade;

create table bracket(
    bracket_id int auto_increment primary key,
    tournament_id int,
    foreign key (tournament_id) references tournament(tournament_id)
    on delete cascade
)engine=innodb;

drop table if exists the_groups;

create table the_groups(
    group_id int auto_increment,
    tournament_id int,
    foreign key (tournament_id) references tournament(tournament_id)
    on delete cascade,
    primary key(group_id, tournament_id)
)engine=innodb;