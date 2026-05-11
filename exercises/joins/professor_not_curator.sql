-- Завдання:
--      Знайти викладачів зі статусом 'викладає', які не є куратором жодної студентської групи
--      Очікувані колонки результату:
--          - повне ім'я викладача (professor_name)
--          - посада (job)
--      Результат відсортувати за:
--          - повним іменем викладача

-- Рішення:
select p.first_name ||' '|| p.last_name as professor_name, p2.job from person p 
join professor p2 on p.person_id = p2.person_id
where p2.professor_id not in (select p3.professor_id from professor p3
join student_group g on p3.professor_id = g.curator_id) and p2.status = 'викладає'
order by professor_name
