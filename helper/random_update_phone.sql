DO $$
DECLARE
    random_student INTEGER;
    random_phone TEXT;
BEGIN
    SELECT код INTO random_student FROM СТУДЕНТЫ ORDER BY RANDOM() LIMIT 1;
    random_phone := '+79' || LPAD(FLOOR(RANDOM() * 100000000)::TEXT, 8, '0');
    UPDATE СТУДЕНТЫ SET телефон = random_phone WHERE код = random_student;
    RAISE NOTICE 'Студенту % присвоен телефон %', random_student, random_phone;
END $$;
