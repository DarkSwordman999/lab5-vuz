INSERT INTO УСПЕВАЕМОСТЬ (дата, студент, группа, преподаватель, дисциплина, оценка)
SELECT 
    CURRENT_DATE - (RANDOM() * 365)::INT,
    (RANDOM() * 49 + 1)::INT,
    (RANDOM() * 9 + 1)::INT,
    (RANDOM() * 14 + 1)::INT,
    (RANDOM() * 19 + 1)::INT,
    (RANDOM() * 3 + 2)::INT
FROM generate_series(1, 100);
\echo 'Добавлено 100 случайных записей'
