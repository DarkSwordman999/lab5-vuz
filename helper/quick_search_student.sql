-- Быстрый поиск студента
SELECT код, фамилия, имя, отчество, телефон, email
FROM СТУДЕНТЫ
WHERE фамилия LIKE CONCAT('%', :'search', '%')
   OR имя LIKE CONCAT('%', :'search', '%')
ORDER BY фамилия, имя;
