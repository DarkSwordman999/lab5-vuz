\echo '=== ДОБАВЛЕНИЕ НОВОГО СТУДЕНТА ==='
\prompt 'Фамилия: ' family
\prompt 'Имя: ' firstname
\prompt 'Телефон: ' phone
\prompt 'Email: ' email

INSERT INTO СТУДЕНТЫ (фамилия, имя, телефон, email, дата_поступления) 
VALUES (:'family', :'firstname', :'phone', :'email', CURRENT_DATE);

\echo '=== СТУДЕНТ ДОБАВЛЕН ==='
SELECT * FROM СТУДЕНТЫ ORDER BY код DESC LIMIT 1;
