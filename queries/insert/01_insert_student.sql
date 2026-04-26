-- INSERT INTO TAB1 VALUES (...)
-- Добавление нового студента

\echo '=== ДО INSERT ==='
SELECT * FROM СТУДЕНТЫ WHERE код = 51;

INSERT INTO СТУДЕНТЫ (код, фамилия, имя, отчество, телефон, email, дата_поступления) 
VALUES (51, 'Новый', 'Студент', 'Студентов', '+79019999999', 'newstudent@edu.ru', '2025-09-01');

\echo '=== ПОСЛЕ INSERT ==='
SELECT * FROM СТУДЕНТЫ WHERE код = 51;
