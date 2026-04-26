CREATE TABLE СТУДЕНТЫ (
    код SERIAL PRIMARY KEY,
    фамилия VARCHAR(50) NOT NULL,
    имя VARCHAR(50) NOT NULL,
    отчество VARCHAR(50),
    телефон VARCHAR(20),
    email VARCHAR(100) UNIQUE,
    дата_поступления DATE
);
