-- Завдання:
--      Вивести список студентів, які мають низькі оцінки (менше 60) разом з інформацією про курс та викладача
--      Очікувані колонки результату:
--          - повне ім'я студента (student_name)
--          - назва групи (group_name)
--          - назва курсу (course_name)
--          - оцінка (grade)
--          - повне ім'я лектора курсу (lecturer_name)
--      Включити тільки записи, де оцінка вже виставлена
--      Включити тільки лекторів
--      Результат відсортувати за:
--          - оцінкою (зростання), потім за назвою групи, потім за іменем студента, потім за назвою курсу

-- Рішення:
select ps.first_name ||' '|| ps.last_name as student_name, 
g.name as group_name, 
c.name as course_name, 
e.grade,
pp.first_name ||' '|| pp.last_name as lecturer_name 
from student s
join person ps on s.person_id = ps.person_id 
join student_group g on g.group_id = s.group_id
join enrolment e on e.student_id = s.student_id
join course c on e.course_id = c.course_id 
join course_teacher ct on c.course_id = ct.course_id 
join professor p2 on ct.professor_id = p2.professor_id
join person pp on p2.person_id  = pp.person_id
where e.grade < 60 and ct.professor_role = 'лектор'
order by e.grade, group_name, student_name, course_name
