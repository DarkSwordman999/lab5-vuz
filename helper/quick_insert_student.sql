-- Быстрое добавление студента
INSERT INTO СТУДЕНТЫ (фамилия, имя, телефон, email) 
VALUES (:'family', :'firstname', :'phone', :'email');
SELECT * FROM СТУДЕНТЫ ORDER BY код DESC LIMIT 1;
