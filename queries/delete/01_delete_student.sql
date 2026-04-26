-- DELETE FROM TAB1 WHERE ключ = значение_ключа
-- Удаление студента с кодом 50

\echo '=== ДО DELETE ==='
SELECT * FROM СТУДЕНТЫ WHERE код = 50;

-- Сначала удаляем связанные записи в УСПЕВАЕМОСТЬ
DELETE FROM УСПЕВАЕМОСТЬ WHERE студент = 50;

DELETE FROM СТУДЕНТЫ WHERE код = 50;

\echo '=== ПОСЛЕ DELETE ==='
SELECT * FROM СТУДЕНТЫ WHERE код = 50;
