-- Быстрое удаление студента
-- Использование: psql -d vuz_lab5 -v sid=51 -f helper/quick_delete_student.sql

\echo '=== ДО DELETE ==='
SELECT код, фамилия, имя FROM СТУДЕНТЫ WHERE код = :sid;

DELETE FROM УСПЕВАЕМОСТЬ WHERE студент = :sid;
DELETE FROM СТУДЕНТЫ WHERE код = :sid;

\echo '=== ПОСЛЕ DELETE ==='
SELECT код, фамилия, имя FROM СТУДЕНТЫ WHERE код = :sid;
