CREATE TABLE ДИСЦИПЛИНЫ (
    код SERIAL PRIMARY KEY,
    название VARCHAR(100) NOT NULL,
    часы INTEGER NOT NULL,
    семестр INTEGER NOT NULL
);
