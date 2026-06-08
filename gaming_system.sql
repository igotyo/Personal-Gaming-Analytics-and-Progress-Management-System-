-- Database Systems Semester Project
-- Personal Gaming Analytics & Progress Management System
-- Run this file in phpMyAdmin or MySQL before opening the PHP pages.

CREATE DATABASE IF NOT EXISTS gaming_system;
USE gaming_system;

DROP TABLE IF EXISTS progress;
DROP TABLE IF EXISTS matches;
DROP TABLE IF EXISTS games;
DROP TABLE IF EXISTS players;

CREATE TABLE players (
    player_id INT AUTO_INCREMENT PRIMARY KEY,
    player_name VARCHAR(100) NOT NULL,
    platform VARCHAR(50) NOT NULL,
    rank_level VARCHAR(50) NOT NULL
);

CREATE TABLE games (
    game_id INT AUTO_INCREMENT PRIMARY KEY,
    game_name VARCHAR(100) NOT NULL,
    genre VARCHAR(50) NOT NULL
);

CREATE TABLE matches (
    match_id INT AUTO_INCREMENT PRIMARY KEY,
    player_id INT NOT NULL,
    game_id INT NOT NULL,
    kills INT NOT NULL DEFAULT 0,
    deaths INT NOT NULL DEFAULT 0,
    assists INT NOT NULL DEFAULT 0,
    accuracy FLOAT NOT NULL DEFAULT 0,
    match_date DATE NOT NULL,
    CONSTRAINT fk_matches_player FOREIGN KEY (player_id) REFERENCES players(player_id) ON DELETE CASCADE,
    CONSTRAINT fk_matches_game FOREIGN KEY (game_id) REFERENCES games(game_id) ON DELETE CASCADE
);

CREATE TABLE progress (
    progress_id INT AUTO_INCREMENT PRIMARY KEY,
    player_id INT NOT NULL,
    game_id INT NOT NULL,
    completion_percentage INT NOT NULL,
    playtime_hours INT NOT NULL,
    difficulty VARCHAR(50) NOT NULL,
    CONSTRAINT fk_progress_player FOREIGN KEY (player_id) REFERENCES players(player_id) ON DELETE CASCADE,
    CONSTRAINT fk_progress_game FOREIGN KEY (game_id) REFERENCES games(game_id) ON DELETE CASCADE,
    CONSTRAINT uq_player_game_progress UNIQUE (player_id, game_id),
    CONSTRAINT chk_completion CHECK (completion_percentage BETWEEN 0 AND 100)
);

INSERT INTO players (player_name, platform, rank_level) VALUES
('Ali', 'Mobile', 'Diamond'),
('Hamza', 'PC', 'Gold'),
('Sara', 'PlayStation', 'Platinum');

INSERT INTO games (game_name, genre) VALUES
('COD Mobile', 'FPS'),
('Valorant', 'FPS'),
('God of War', 'Story'),
('Spider-Man', 'Story');

INSERT INTO matches (player_id, game_id, kills, deaths, assists, accuracy, match_date) VALUES
(1, 1, 18, 6, 4, 72.5, '2026-05-01'),
(1, 2, 22, 9, 7, 68.2, '2026-05-03'),
(2, 2, 14, 7, 5, 61.8, '2026-05-04'),
(3, 1, 25, 8, 6, 76.4, '2026-05-05');

INSERT INTO progress (player_id, game_id, completion_percentage, playtime_hours, difficulty) VALUES
(1, 3, 70, 18, 'Hard'),
(2, 4, 45, 10, 'Normal'),
(3, 3, 90, 25, 'Hard');
