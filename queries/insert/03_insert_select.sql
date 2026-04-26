-- INSERT INTO TAB1 SELECT * FROM TAB1a WHERE выражение
-- Добавление отличных оценок в архив (демонстрация)

\echo '=== ДО INSERT ==='
SELECT COUNT(*) FROM УСПЕВАЕМОСТЬ WHERE оценка = 5;

-- Создаём таблицу-архив (если не существует)
CREATE TABLE IF NOT EXISTS УСПЕВАЕМОСТЬ_ОТЛИЧНО (
    код_записи INTEGER,
    студент INTEGER,
    группа INTEGER,
    преподаватель INTEGER,
    дисциплина INTEGER,
    оценка INTEGER,
    дата DATE
);

INSERT INTO УСПЕВАЕМОСТЬ_ОТЛИЧНО (код_записи, студент, группа, преподаватель, дисциплина, оценка, дата)
SELECT код_записи, студент, группа, преподаватель, дисциплина, оценка, дата
FROM УСПЕВАЕМОСТЬ
WHERE оценка = 5
LIMIT 5;

\echo '=== ПОСЛЕ INSERT ==='
SELECT COUNT(*) FROM УСПЕВАЕМОСТЬ_ОТЛИЧНО;
