-- Показать количество записей во всех таблицах
SELECT 'СТУДЕНТЫ' as Таблица, COUNT(*) as Количество FROM СТУДЕНТЫ
UNION ALL
SELECT 'ГРУППЫ', COUNT(*) FROM ГРУППЫ
UNION ALL
SELECT 'ПРЕПОДАВАТЕЛИ', COUNT(*) FROM ПРЕПОДАВАТЕЛИ
UNION ALL
SELECT 'ДИСЦИПЛИНЫ', COUNT(*) FROM ДИСЦИПЛИНЫ
UNION ALL
SELECT 'УСПЕВАЕМОСТЬ', COUNT(*) FROM УСПЕВАЕМОСТЬ;
