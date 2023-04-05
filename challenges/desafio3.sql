SELECT
  u.name_user pessoa_usuaria,
  COUNT(h.user_id) musicas_ouvidas,
  ROUND((SUM(t.time)/60), 2) total_minutos
 FROM users u
   INNER JOIN history_music h ON u.user_id = h.user_id
   INNER JOIN tracks t ON t.track_id = h.history_music_id
 GROUP BY u.user_id 
 ORDER BY u.name_user;