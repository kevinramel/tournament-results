-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.	
DROP DATABASE IF EXISTS tournament;
CREATE DATABASE tournament;
\c tournament

/* Create players table */	
CREATE TABLE players ( 
	id 			SERIAL PRIMARY KEY,
	name 		TEXT);
	
/* Create matches table */	
CREATE TABLE matches (
	id SERIAL PRIMARY KEY, 
	winner INTEGER REFERENCES players(id) ON DELETE CASCADE, 
	loser INTEGER REFERENCES players(id) ON DELETE CASCADE);

/* Create match count view */
CREATE VIEW match_count AS
SELECT players.id, COUNT(matches.id) AS matches
FROM players LEFT JOIN matches
ON players.id = matches.winner OR players.id = matches.loser
GROUP BY players.id
ORDER BY players.id;

/* Create win count view */
CREATE VIEW win_count AS
SELECT players.id, COUNT (matches.winner) AS wins
FROM players LEFT JOIN matches
ON players.id = matches.winner
GROUP BY players.id
ORDER BY wins DESC;

/* Create standings view */
CREATE VIEW standings AS
SELECT p.id, p.name, COALESCE(w.wins,0) as wins, m.matches AS matches
FROM players AS p 
LEFT JOIN match_count AS m ON p.id = m.id
LEFT JOIN win_count AS w ON p.id = w.id
ORDER BY wins DESC, id;

SELECT * FROM players;
SELECT * FROM matches;
SELECT * FROM match_count;
SELECT * FROM win_count;
SELECT * FROM standings;

