DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

CREATE TABLE plans(
    plan_id INT PRIMARY KEY AUTO_INCREMENT,
    plan VARCHAR(50) NOT NULL,
    value DECIMAL(4,2) NOT NULL
) engine = InnoDB;

CREATE TABLE users(
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name_user VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    plan_id INT NOT NULL,
    signature_date DATE NOT NULL,
    FOREIGN KEY (plan_id) REFERENCES SpotifyClone.plans (plan_id)
) engine = InnoDB;

CREATE TABLE artist(
    artist_id INT PRIMARY KEY AUTO_INCREMENT,
    name_artist VARCHAR(50) NOT NULL
) engine = InnoDB;

CREATE TABLE follows(
    user_id INT NOT NULL,
    artist_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY(user_id, artist_id),
    FOREIGN KEY (user_id) REFERENCES SpotifyClone.users (user_id),
    FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist (artist_id)
) engine = InnoDB;

CREATE TABLE albums(
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    name_album VARCHAR(50) NOT NULL,
    artist_id INT NOT NULL,
    year YEAR NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist (artist_id)
) engine = InnoDB;

CREATE TABLE tracks(
    track_id INT PRIMARY KEY AUTO_INCREMENT,
    name_track VARCHAR(50) NOT NULL,
    album_id INT NOT NULL,
    time INT,
    FOREIGN KEY (album_id) REFERENCES SpotifyClone.albums (album_id)
) engine = InnoDB;

CREATE TABLE history_music(
    history_music_id INT NOT NULL,
    user_id INT NOT NULL,
    date DATETIME NOT NULL,
    CONSTRAINT PRIMARY KEY(history_music_id, user_id),
    FOREIGN KEY (history_music_id) REFERENCES SpotifyClone.tracks (track_id),
    FOREIGN KEY (user_id) REFERENCES SpotifyClone.users (user_id)
) engine = InnoDB;

INSERT INTO plans (plan_id, plan, value)
  VALUES
    (1, 'gratuito', 0.00),
    (2, 'familiar', 7.99),
    (3, 'universitário', 5.99),
    (4, 'pessoal', 6.99);
    
INSERT INTO users (name_user, age, plan_id, signature_date)
VALUES
  ('Barbara Liskov', 82, 1,'2019-10-20'),
  ('Robert Cecil Martin',58,1,'2017-01-06'),
  ('Ada Lovelace',37,2,'2017-12-30'),
  ('Martin Fowler',46,2,'2017-01-17'),
  ('Sandi Metz',58,2,'2018-04-29'),
  ('Paulo Freire',19,3,'2018-02-14'),
  ('Bell Hooks',26,3,'2018-01-05'),
  ('Christopher Alexander',85,4,'2019-06-05'),
  ('Judith Butler',45,4,'2020-05-13'),
  ('Jorge Amado',58,4,'2017-02-17');
  
INSERT INTO artist (name_artist)
VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');
  
INSERT INTO follows (user_id, artist_id)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 1),
  (7, 6),
  (9, 3),
  (10, 2);
  
INSERT INTO albums (name_album, year, artist_id)
VALUES
  ('Renaissance', 2022, 1),
  ('Jazz', 1978, 2),
  ('Hot Space', 1982, 2),
  ('Falso Brilhante', 1998, 3),
  ('Vento de Maio', 2001, 3),
  ('QVVJFA?', 2003, 4),
  ('Somewhere Far Beyond', 2007, 5),
  ('I Put A Spell On You', 2012, 6);
  
INSERT INTO tracks (name_track, album_id, time)
VALUES
  ("BREAK MY SOUL", 1, 279),
  ("VIRGO'S GROOVE", 1, 369),
  ("ALIEN SUPERSTAR", 1, 116),
  ("Don't Stop Me Now", 2, 203),
  ("Under Pressure", 3, 152),
  ("Como Nossos Pais", 4, 105),
  ("O Medo de Amar é o Medo de Ser Livre", 5, 207),
  ("Samba em Paris", 6, 267),
  ("The Bard's Song", 7, 244),
  ("Feeling Good", 8, 100);
  
  INSERT INTO history_music (history_music_id, user_id, date)
VALUES
	(8,1,'2022-02-28 10:45:55'),
    (8,4,'2021-08-15 17:10:10'),
    (8,5,'2022-01-09 01:44:33'),
    (2,1,'2020-05-02 05:30:35'),
    (2,3,'2020-12-05 18:38:30'),
    (10,1,'2020-03-06 11:22:33'),
    (10,2,'2022-08-05 08:05:17'),
    (10,3,'2020-11-13 16:55:13'),
    (7,2,'2020-01-02 07:40:33'),
    (7,6,'2017-01-24 00:31:17'),
    (5,5,'2020-08-06 15:23:43'),
    (1,6,'2017-10-12 12:35:20'),
    (4,7,'2011-12-15 22:30:49'),
    (4,8,'2012-03-17 14:56:41'),
    (9,9,'2022-02-24 21:14:22'),
    (3,10,'2015-12-13 08:30:22');