INSERT INTO УСПЕВАЕМОСТЬ (дата, студент, группа, преподаватель, дисциплина, оценка)
SELECT 
    CURRENT_DATE,
    (RANDOM() * 50 + 1)::INT,
    (RANDOM() * 9 + 1)::INT,
    (RANDOM() * 14 + 1)::INT,
    (RANDOM() * 19 + 1)::INT,
    (RANDOM() * 3 + 2)::INT;
\echo 'Добавлена случайная оценка'
