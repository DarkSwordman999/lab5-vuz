\echo '============================================='
\echo '       РЕДАКТИРОВАНИЕ СТУДЕНТА'
\echo '============================================='

\prompt 'Код студента: ' s_id

\echo ''
\echo 'ТЕКУЩИЕ ДАННЫЕ:'
SELECT код, фамилия, имя, отчество, телефон, email FROM СТУДЕНТЫ WHERE код = :s_id;

\echo ''
\echo 'Введите новые данные (Enter - оставить без изменений)'
\prompt 'Новая фамилия: ' lastname
\prompt 'Новое имя: ' firstname
\prompt 'Новый телефон: ' phone
\prompt 'Новый email: ' email

UPDATE СТУДЕНТЫ SET 
    фамилия = COALESCE(NULLIF(:'lastname', ''), фамилия),
    имя = COALESCE(NULLIF(:'firstname', ''), имя),
    телефон = COALESCE(NULLIF(:'phone', ''), телефон),
    email = COALESCE(NULLIF(:'email', ''), email)
WHERE код = :s_id;

\echo '============================================='
\echo 'ДАННЫЕ ОБНОВЛЕНЫ'
\echo '============================================='

SELECT код, фамилия, имя, телефон, email FROM СТУДЕНТЫ WHERE код = :s_id;
