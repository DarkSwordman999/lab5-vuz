-- Распределение оценок
SELECT 
    оценка,
    COUNT(*) AS количество,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS процент
FROM УСПЕВАЕМОСТЬ
GROUP BY оценка
ORDER BY оценка DESC;
