-- Состояние ДО DELETE
SELECT 'СТУДЕНТЫ (код=50)' as Таблица, фамилия || ' ' || имя FROM СТУДЕНТЫ WHERE код = 50
UNION ALL
SELECT 'Успеваемость с оценкой 2', COUNT(*)::text FROM УСПЕВАЕМОСТЬ WHERE оценка = 2;
