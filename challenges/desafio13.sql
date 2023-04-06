SELECT
  CASE
    WHEN u.age <= 30 THEN 'Até 30 anos'
    WHEN u.age BETWEEN 30 AND 61 THEN 'Entre 31 e 60 anos'
    ELSE 'Maior de 60 anos' END faixa_etaria,
  COUNT(DISTINCT u.name_user) total_pessoas_usuarias,
  COUNT(ft.track_id_fav) total_favoritadas
FROM users u
LEFT JOIN favorite_tracks ft
  ON ft.user_id = u.user_id
GROUP BY faixa_etaria;