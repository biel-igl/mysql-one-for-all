SELECT
   u.name_user pessoa_usuaria,
   IF(MAX(YEAR(h.date))>=2021,'Ativa','Inativa') status_pessoa_usuaria
FROM users u
INNER JOIN history_music h ON u.user_id = h.user_id
  GROUP BY u.user_id
  ORDER BY u.name_user;