CREATE TABLE УСПЕВАЕМОСТЬ (
    код_записи SERIAL PRIMARY KEY,
    дата DATE NOT NULL,
    студент INTEGER REFERENCES СТУДЕНТЫ(код),
    группа INTEGER REFERENCES ГРУППЫ(код),
    преподаватель INTEGER REFERENCES ПРЕПОДАВАТЕЛИ(код),
    дисциплина INTEGER REFERENCES ДИСЦИПЛИНЫ(код),
    оценка INTEGER NOT NULL CHECK (оценка BETWEEN 2 AND 5)
);
