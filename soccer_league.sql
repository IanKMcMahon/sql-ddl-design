-- from the terminal run:
-- psql < soccer_league.sql

DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams
(
id SERIAL PRIMARY KEY,
name TEXT,
city TEXT
);

CREATE TABLE goals
(
id SERIAL PRIMARY KEY,
player_id INTEGER REFERENCES players,
match_id INTEGER REFERENCES matches
);
CREATE TABLE players
(
id SERIAL PRIMARY KEY,
name TEXT,
team_id INTEGER REFERENCES teams
);
CREATE TABLE matches
(
id SERIAL PRIMARY KEY,
date DATE,
location TEXT,
team1_id INTEGER REFERENCES teams,
team2_id INTEGER REFERENCES teams,
head_ref_id INTEGER REFERENCES referees,
season_id INTEGER REFERENCES seasons
);
CREATE TABLE seasons
(
id SERIAL PRIMARY KEY,
start_date DATE,
end_date DATE
);
CREATE TABLE results
(
id SERIAL PRIMARY KEY,
team_id INTEGER REFERENCES teams,
match_id REFERENCES matches
result TEXT
);
CREATE TABLE lineups 
(
id SERIAL PRIMARY KEY,
player_id INTEGER REFERENCES players,
match_id INTEGER REFERENCES matches,
team_id INTEGER REFERENCES teams
);
CREATE TABLE referees
(
id SERIAL PRIMARY KEY,
name TEXT
);