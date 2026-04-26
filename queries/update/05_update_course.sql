-- UPDATE: Повышение курса для всех групп на 1 (демонстрация)

\echo '=== ДО UPDATE ==='
SELECT название, курс FROM ГРУППЫ WHERE курс = 1;

UPDATE ГРУППЫ SET курс = курс + 1 WHERE курс = 1;

\echo '=== ПОСЛЕ UPDATE ==='
SELECT название, курс FROM ГРУППЫ WHERE курс = 2;
