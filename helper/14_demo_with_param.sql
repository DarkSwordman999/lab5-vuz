-- ЗАПРОС С ПАРАМЕТРОМ (arg1)
-- Использование: psql -d vuz_lab5 -v arg1='Информационных технологий' -f helper/14_demo_with_param.sql

\echo '=== ГРУППЫ ФАКУЛЬТЕТА: ' :arg1 ' ==='
SELECT код, название, курс
FROM ГРУППЫ
WHERE факультет LIKE CONCAT('%', :'arg1', '%')
ORDER BY курс, название;
