#!/bin/bash
DATABASE="vuz_lab5"

if [ -z "$1" ]; then
    echo "Использование: ./s task1|task2|task3|task4 <день>"
    echo ""
    echo "Доступные задачи:"
    echo "  ./s task1                    - средний балл по сезонам"
    echo "  ./s task2                    - средний балл по факультетам и сезонам"
    echo "  ./s task3                    - средний балл по дням недели и преподавателям"
    echo "  ./s task4 <день_недели>      - средний балл по дисциплинам за день"
    echo "Пример: ./s task4 1"
    exit 1
fi

case "$1" in
    task1)
        psql -d $DATABASE -f queries/tasks/01_avg_grade_by_season.sql
        ;;
    task2)
        psql -d $DATABASE -f queries/tasks/02_grades_by_faculty_and_season.sql
        ;;
    task3)
        psql -d $DATABASE -f queries/tasks/03_grades_by_day_and_teacher.sql
        ;;
    task4)
        if [ -z "$2" ]; then
            echo "Укажите день недели (1-7): ./s task4 1"
        else
            psql -d $DATABASE -v arg1="$2" -f queries/tasks/04_avg_grade_by_subject_for_day.sql
        fi
        ;;
    *)
        echo "Неизвестная задача: $1"
        ;;
esac
