\echo '============================================='
\echo '       ДОБАВЛЕНИЕ НОВОГО СТУДЕНТА'
\echo '============================================='

\prompt 'Фамилия: ' lastname
\prompt 'Имя: ' firstname
\prompt 'Отчество (Enter - пропустить): ' middlename
\prompt 'Телефон (формат +7XXXXXXXXXX): ' phone
\prompt 'Email: ' email
\prompt 'Дата поступления (ГГГГ-ММ-ДД, Enter - сегодня): ' date_in

SELECT EXISTS(SELECT 1 FROM СТУДЕНТЫ WHERE email = :'email') as email_exists \gset

\if :email_exists
    \echo 'ОШИБКА: Студент с таким email уже существует'
    \quit
\endif

INSERT INTO СТУДЕНТЫ (фамилия, имя, отчество, телефон, email, дата_поступления) 
VALUES (:'lastname', :'firstname', NULLIF(:'middlename', ''), :'phone', :'email', 
        COALESCE(NULLIF(:'date_in', '')::DATE, CURRENT_DATE));

\echo '============================================='
\echo 'СТУДЕНТ УСПЕШНО ДОБАВЛЕН'
\echo '============================================='

SELECT код, фамилия, имя, отчество, телефон, email, дата_поступления 
FROM СТУДЕНТЫ 
WHERE код = (SELECT MAX(код) FROM СТУДЕНТЫ);
