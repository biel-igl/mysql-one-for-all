SELECT
  a.name_artist artista,
  IF(COUNT(ft.track_id_fav) = 0,'-',
    IF(COUNT(ft.track_id_fav) >= 5, 'A',
      IF(COUNT(ft.track_id_fav) >=3,'B',
        IF(COUNT(ft.track_id_fav) >=1, 'C','-'))))
  ranking
FROM artist a
INNER JOIN albums b ON a.artist_id = b.artist_id
INNER JOIN tracks t
  ON t.album_id = b.album_id
LEFT JOIN favorite_tracks ft 
  ON ft.track_id_fav = t.track_id
GROUP BY a.name_artist
ORDER BY COUNT(ft.track_id_fav) DESC, artista;