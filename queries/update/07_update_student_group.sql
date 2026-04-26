-- Изменение группы студента
\echo '=== ДО UPDATE ==='
SELECT код, фамилия, имя, группа FROM СТУДЕНТЫ WHERE код = :student_id;

UPDATE СТУДЕНТЫ SET группа = :group_id WHERE код = :student_id;

\echo '=== ПОСЛЕ UPDATE ==='
SELECT код, фамилия, имя, группа FROM СТУДЕНТЫ WHERE код = :student_id;
