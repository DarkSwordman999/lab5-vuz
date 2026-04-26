-- Быстрое обновление телефона студента
-- Использование: psql -d vuz_lab5 -v sid=1 -v new_phone='+79001112233' -f helper/quick_update_phone.sql

\echo '=== ДО UPDATE ==='
SELECT код, фамилия, имя, телефон FROM СТУДЕНТЫ WHERE код = :sid;

UPDATE СТУДЕНТЫ SET телефон = :'new_phone' WHERE код = :sid;

\echo '=== ПОСЛЕ UPDATE ==='
SELECT код, фамилия, имя, телефон FROM СТУДЕНТЫ WHERE код = :sid;
