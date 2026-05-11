-- Завдання:
--      Вивести список усіх активних курсів разом з іменами їхніх викладачів та їхніми ролями
--      Очікувані колонки результату:
--          - назва курсу (course_name)
--          - повне ім'я викладача (professor_name)
--          - роль викладача на курсі (role)
--      Включити тільки курси зі статусом 'активний'
--      Результат відсортувати за:
--          - назвою курсу, потім за роллю викладача

-- Рішення:
select c.name as course_name, p.first_name ||' '|| p.last_name as professor_name, t.professor_role from person p 
join professor p2 on p.person_id = p2.person_id
join course_teacher t on t.professor_id = p2.professor_id 
join course c on c.course_id = t.course_id 
where c.status = 'активний'
order by course_name, t.professor_role 
