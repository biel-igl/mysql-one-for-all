SELECT
  a.name_artist artista,
  b.name_album album,
  COUNT(f.artist_id) pessoas_seguidoras
FROM albums b 
INNER JOIN artist a ON b.artist_id = a.artist_id
INNER JOIN follows f ON a.artist_id = f.artist_id
GROUP BY a.name_artist, b.name_album
ORDER BY pessoas_seguidoras DESC, artista, album;