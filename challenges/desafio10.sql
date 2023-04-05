CREATE TABLE favorite_tracks(
    user_id INT NOT NULL,
    track_id_fav INT NOT NULL,
    CONSTRAINT PRIMARY KEY(user_id, track_id_fav),
    FOREIGN KEY (user_id) REFERENCES SpotifyClone.users (user_id),
    FOREIGN KEY (track_id_fav) REFERENCES SpotifyClone.tracks (track_id)
) engine = InnoDB;

INSERT INTO favorite_tracks (user_id, track_id_fav)
VALUES 
  (1,3),
  (1,6),
  (1,10),
  (2,4),
  (3,1),
  (3,3),
  (4,7),
  (4,4),
  (5,10),
  (5,2),
  (8,4),
  (9,7),
  (10,3);