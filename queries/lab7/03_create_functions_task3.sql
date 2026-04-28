-- ============================================================
-- ЛАБОРАТОРНАЯ РАБОТА №7
-- ЗАДАЧА 3: Сводная таблица (PIVOT)
-- Средний балл по группам (строки) и дисциплинам (столбцы)
-- ============================================================

-- ============================================================
-- СПОСОБ 1: Использование встроенной функции crosstab()
-- ============================================================

-- Подключаем расширение tablefunc
CREATE EXTENSION IF NOT EXISTS tablefunc;

-- Подготавливаем данные для сводной таблицы
DROP VIEW IF EXISTS v_pivot_data;
CREATE VIEW v_pivot_data AS
SELECT 
    ГР.название AS группа,
    Д.название AS дисциплина,
    ROUND(AVG(У.оценка), 2) AS средний_балл
FROM УСПЕВАЕМОСТЬ У
JOIN ГРУППЫ ГР ON ГР.код = У.группа
JOIN ДИСЦИПЛИНЫ Д ON Д.код = У.дисциплина
GROUP BY ГР.название, Д.название
ORDER BY ГР.название, Д.название;

-- ============================================================
-- СПОСОБ 2: Ручное построение сводной таблицы (без crosstab)
-- ============================================================

-- Функция 3.1: Получить средний балл для пары группа+дисциплина (скалярная)
DROP FUNCTION IF EXISTS get_avg_grade_for_pair(VARCHAR, VARCHAR);

CREATE OR REPLACE FUNCTION get_avg_grade_for_pair(
    p_group_name VARCHAR,
    p_subject_name VARCHAR
) RETURNS NUMERIC(3,2) AS $$
/*
  НАЗНАЧЕНИЕ: Возвращает средний балл для конкретной группы и дисциплины
  ВХОД: p_group_name - название группы, p_subject_name - название дисциплины
  ВЫХОД: средний балл (2.00-5.00) или NULL
  АЛГОРИТМ: JOIN УСПЕВАЕМОСТЬ + ГРУППЫ + ДИСЦИПЛИНЫ с фильтрацией
*/
BEGIN
    RETURN (
        SELECT ROUND(AVG(У.оценка), 2)
        FROM УСПЕВАЕМОСТЬ У
        JOIN ГРУППЫ Г ON Г.код = У.группа
        JOIN ДИСЦИПЛИНЫ Д ON Д.код = У.дисциплина
        WHERE Г.название = p_group_name AND Д.название = p_subject_name
    );
END;
$$ LANGUAGE PLpgSQL;

-- Функция 3.2: Получить все группы (для строк сводной таблицы)
DROP FUNCTION IF EXISTS get_all_groups();

CREATE OR REPLACE FUNCTION get_all_groups()
RETURNS TABLE(группа VARCHAR, порядковый_номер INT) AS $$
/*
  НАЗНАЧЕНИЕ: Возвращает список всех групп для строк сводной таблицы
  ВХОД: нет
  ВЫХОД: таблица с названием группы и порядковым номером
*/
BEGIN
    RETURN QUERY 
    SELECT название, ROW_NUMBER() OVER (ORDER BY название)
    FROM ГРУППЫ
    ORDER BY название;
END;
$$ LANGUAGE PLpgSQL;

-- Функция 3.3: Получить все дисциплины (для столбцов сводной таблицы)
DROP FUNCTION IF EXISTS get_all_subjects();

CREATE OR REPLACE FUNCTION get_all_subjects()
RETURNS TABLE(дисциплина VARCHAR, порядковый_номер INT) AS $$
/*
  НАЗНАЧЕНИЕ: Возвращает список дисциплин для столбцов сводной таблицы
  ВХОД: нет
  ВЫХОД: таблица с названием дисциплины и порядковым номером
*/
BEGIN
    RETURN QUERY 
    SELECT название, ROW_NUMBER() OVER (ORDER BY название)
    FROM ДИСЦИПЛИНЫ
    ORDER BY название
    LIMIT 8;  -- Ограничиваем 8 столбцами согласно требованию (5-8)
END;
$$ LANGUAGE PLpgSQL;

-- Функция 3.4 (главная): Построение сводной таблицы в формате JSON
DROP FUNCTION IF EXISTS build_pivot_table();

CREATE OR REPLACE FUNCTION build_pivot_table()
RETURNS TABLE(
    группа VARCHAR,
    pivot_data JSONB
) AS $$
/*
  НАЗНАЧЕНИЕ: Строит сводную таблицу "группы (строки) x дисциплины (столбцы)"
  ВХОД: нет
  ВЫХОД: таблица с названием группы и JSONB-объектом "дисциплина: средний_балл"
  АЛГОРИТМ: Двойной цикл по группам и дисциплинам, вызов get_avg_grade_for_pair
  ОСОБЕННОСТИ: Использует 4 функции пользователя (всего 4 функции)
*/
DECLARE
    v_group RECORD;
    v_subject RECORD;
    v_result JSONB := '{}'::JSONB;
BEGIN
    FOR v_group IN SELECT * FROM get_all_groups() LOOP
        v_result := '{}'::JSONB;
        
        FOR v_subject IN SELECT * FROM get_all_subjects() LOOP
            v_result := v_result || jsonb_build_object(
                v_subject.дисциплина,
                COALESCE(get_avg_grade_for_pair(v_group.группа, v_subject.дисциплина), 0)
            );
        END LOOP;
        
        RETURN QUERY SELECT v_group.группа, v_result;
    END LOOP;
END;
$$ LANGUAGE PLpgSQL;
