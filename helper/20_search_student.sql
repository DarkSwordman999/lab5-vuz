-- Быстрый поиск студента по фамилии
-- Использование: psql -d vuz_lab5 -v name='Иванов' -f helper/20_search_student.sql

SELECT код, фамилия, имя, отчество, телефон, email
FROM СТУДЕНТЫ
WHERE фамилия LIKE CONCAT('%', :'name', '%')
ORDER BY фамилия, имя;
