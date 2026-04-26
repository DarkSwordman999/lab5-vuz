\echo '============================================='
\echo '         ДОБАВЛЕНИЕ ОЦЕНКИ'
\echo '============================================='

\prompt 'Код студента: ' s_id
\prompt 'Код дисциплины: ' subj_id
\prompt 'Оценка (2-5): ' grade

SELECT EXISTS(SELECT 1 FROM СТУДЕНТЫ WHERE код = :s_id) as student_exists \gset
\if NOT :student_exists
    \echo 'ОШИБКА: Студент с таким кодом не найден'
    \quit
\endif

SELECT EXISTS(SELECT 1 FROM ДИСЦИПЛИНЫ WHERE код = :subj_id) as subject_exists \gset
\if NOT :subject_exists
    \echo 'ОШИБКА: Дисциплина с таким кодом не найдена'
    \quit
\endif

\if :grade < 2 OR :grade > 5
    \echo 'ОШИБКА: Оценка должна быть от 2 до 5'
    \quit
\endif

SELECT группа INTO :group_id FROM СТУДЕНТЫ WHERE код = :s_id;
SELECT преподаватель INTO :teacher_id FROM ДИСЦИПЛИНЫ WHERE код = :subj_id;

INSERT INTO УСПЕВАЕМОСТЬ (дата, студент, группа, преподаватель, дисциплина, оценка) 
VALUES (CURRENT_DATE, :s_id, :group_id, :teacher_id, :subj_id, :grade);

\echo '============================================='
\echo 'ОЦЕНКА УСПЕШНО ДОБАВЛЕНА'
\echo '============================================='

SELECT 
    СТУДЕНТЫ.фамилия || ' ' || СТУДЕНТЫ.имя AS студент,
    ДИСЦИПЛИНЫ.название AS дисциплина,
    УСПЕВАЕМОСТЬ.оценка,
    УСПЕВАЕМОСТЬ.дата
FROM УСПЕВАЕМОСТЬ
JOIN СТУДЕНТЫ ON СТУДЕНТЫ.код = УСПЕВАЕМОСТЬ.студент
JOIN ДИСЦИПЛИНЫ ON ДИСЦИПЛИНЫ.код = УСПЕВАЕМОСТЬ.дисциплина
WHERE УСПЕВАЕМОСТЬ.код_записи = (SELECT MAX(код_записи) FROM УСПЕВАЕМОСТЬ);
