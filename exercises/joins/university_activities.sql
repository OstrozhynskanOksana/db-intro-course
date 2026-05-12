-- Завдання:
--      Сформувати єдиний список активностей університету, що поєднує:
--          - записи студентів на курси
--          - призначення викладачів на курси
--      Очікувані колонки результату:
--          - повне ім'я (full_name)
--          - назва курсу (course_name)
--          - тип активності (activity_type) - 'запис на курс' або 'викладання курсу'
--      Включити тільки активні курси (статус 'активний')
--      Результат відсортувати за:
--          - назвою курсу, потім за типом активності, потім за іменем

-- Рішення:
select 
ps.first_name ||' '|| ps.last_name as full_name,
c.name as course_name,
'запис на курс' as activity_type
from student s
join person ps on s.person_id = ps.person_id 
join enrolment e on s.student_id = e.student_id 
join course c on e.course_id = c.course_id
where c.status = 'активний'
  
union 

select
pp.first_name ||' '|| pp.last_name as full_name,
c.name as course_name,
'викладання курсу' as activity_type 
from professor p 
join person pp on p.person_id = pp.person_id 
join course_teacher ct on p.professor_id = ct.professor_id 
join course c on ct.course_id = c.course_id 
where c.status = 'активний'
order by course_name asc, activity_type asc, full_name collate "C" asc

