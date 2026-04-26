CREATE TABLE ПРЕПОДАВАТЕЛИ (
    код SERIAL PRIMARY KEY,
    фамилия VARCHAR(50) NOT NULL,
    имя VARCHAR(50) NOT NULL,
    отчество VARCHAR(50),
    ученая_степень VARCHAR(50),
    должность VARCHAR(50)
);
