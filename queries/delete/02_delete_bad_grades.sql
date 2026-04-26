-- DELETE FROM TAB2 USING TAB3 WHERE выражение
-- Удаление записей успеваемости с оценкой 2 (неудовлетворительно)

\echo '=== КОЛИЧЕСТВО ДО DELETE ==='
SELECT COUNT(*) FROM УСПЕВАЕМОСТЬ WHERE оценка = 2;

DELETE FROM УСПЕВАЕМОСТЬ USING СТУДЕНТЫ 
WHERE УСПЕВАЕМОСТЬ.студент = СТУДЕНТЫ.код 
  AND УСПЕВАЕМОСТЬ.оценка = 2;

\echo '=== КОЛИЧЕСТВО ПОСЛЕ DELETE ==='
SELECT COUNT(*) FROM УСПЕВАЕМОСТЬ WHERE оценка = 2;
