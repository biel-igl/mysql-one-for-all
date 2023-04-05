SELECT
  MIN(p.value) faturamento_minimo,
  MAX(p.value) faturamento_maximo,
  ROUND(AVG(p.value), 2) faturamento_medio,
  SUM(p.value) faturamento_total
FROM plans p
INNER JOIN users u ON u.plan_id = p.plan_id;