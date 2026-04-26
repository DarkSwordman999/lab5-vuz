-- INSERT INTO TAB1 VALUES (...)
-- Добавление новой дисциплины

\echo '=== ДО INSERT ==='
SELECT * FROM ДИСЦИПЛИНЫ WHERE код = 21;

INSERT INTO ДИСЦИПЛИНЫ (код, название, часы, семестр) 
VALUES (21, 'Машинное обучение', 144, 6);

\echo '=== ПОСЛЕ INSERT ==='
SELECT * FROM ДИСЦИПЛИНЫ WHERE код = 21;
