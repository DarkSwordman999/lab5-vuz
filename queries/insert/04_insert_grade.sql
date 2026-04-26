-- Добавление оценки студенту
\echo '=== ДОБАВЛЕНИЕ ОЦЕНКИ ==='

INSERT INTO УСПЕВАЕМОСТЬ (дата, студент, группа, преподаватель, дисциплина, оценка) 
SELECT 
    CURRENT_DATE,
    :student_id,
    (SELECT группа FROM СТУДЕНТЫ WHERE код = :student_id),
    (SELECT преподаватель FROM ДИСЦИПЛИНЫ WHERE код = :subject_id),
    :subject_id,
    :grade;

\echo 'Оценка добавлена!'
