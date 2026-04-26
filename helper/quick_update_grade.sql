-- Быстрое обновление оценки
\echo '=== ДО UPDATE ==='
SELECT студент, дисциплина, оценка FROM УСПЕВАЕМОСТЬ 
WHERE студент = :student_id AND дисциплина = :subject_id;

UPDATE УСПЕВАЕМОСТЬ SET оценка = :new_grade 
WHERE студент = :student_id AND дисциплина = :subject_id;

\echo '=== ПОСЛЕ UPDATE ==='
SELECT студент, дисциплина, оценка FROM УСПЕВАЕМОСТЬ 
WHERE студент = :student_id AND дисциплина = :subject_id;
