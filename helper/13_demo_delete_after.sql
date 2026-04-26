-- Состояние ПОСЛЕ DELETE
SELECT 'СТУДЕНТЫ (код=50)' as Таблица, COALESCE(фамилия || ' ' || имя, 'удалён') FROM СТУДЕНТЫ WHERE код = 50
UNION ALL
SELECT 'Успеваемость с оценкой 2', COUNT(*)::text FROM УСПЕВАЕМОСТЬ WHERE оценка = 2;
