\echo '=== TABLE STUDENTS ==='
SELECT column_name, data_type, is_nullable 
FROM information_schema.columns 
WHERE table_name = 'СТУДЕНТЫ' 
ORDER BY ordinal_position;

\echo '=== TABLE GROUPS ==='
SELECT column_name, data_type, is_nullable 
FROM information_schema.columns 
WHERE table_name = 'ГРУППЫ' 
ORDER BY ordinal_position;

\echo '=== TABLE PERFORMANCE ==='
SELECT column_name, data_type, is_nullable 
FROM information_schema.columns 
WHERE table_name = 'УСПЕВАЕМОСТЬ' 
ORDER BY ordinal_position;
