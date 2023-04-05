SELECT
  b.name_album album,
  COUNT(ft.track_id_fav) favoritadas
FROM albums b 
INNER JOIN tracks t
  ON t.album_id = b.album_id
INNER JOIN favorite_tracks ft 
  ON ft.track_id_fav = t.track_id
GROUP BY b.name_album
ORDER BY favoritadas DESC, b.name_album
LIMIT 3;