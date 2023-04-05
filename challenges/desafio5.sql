SELECT
  t.name_track cancao,
  COUNT(h.history_music_id) reproducoes
FROM tracks t
INNER JOIN history_music h
  ON t.track_id = h.history_music_id
GROUP BY t.name_track
ORDER BY reproducoes DESC, cancao
LIMIT 2;