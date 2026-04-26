INSERT INTO УСПЕВАЕМОСТЬ (дата, студент, группа, преподаватель, дисциплина, оценка)
SELECT 
    random_date('2024-01-01', '2024-12-31'),
    (random() * 49 + 1)::INT,
    (random() * 9 + 1)::INT,
    (random() * 14 + 1)::INT,
    (random() * 19 + 1)::INT,
    (random() * 3 + 2)::INT
FROM generate_series(1, 1000);
