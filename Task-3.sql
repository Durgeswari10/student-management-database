-- Task 3
-- --------

use StudentManagement;

-- Top student per course :
select c.name as course,
		s.name as student,
        e.grade
	from Enrollments e
    join Students s on e.std_id = s.stdid
    join Courses c on e.course_id = c.id
    where (e.course_id , e.grade) in (
    select course_id , max(grade)
		from Enrollments
    group by course_id);



-- Pass rate per course (grade >= 40) :

select c.name as course ,
	round(sum(case when e.grade >= 40 
				then 1 else 0 end) * 100.0 / count(*) , 2) as pass_rate
					from Enrollments e
                    join Courses c on e.course_id = c.id
                    group by c.name;



-- Overall topper across all courses :

select s.name as student ,
		sum(e.grade) as total_marks
	from Enrollments e
    join Students s on e.std_id = s.stdid
    group by s.stdid , s.name
    order by total_marks desc
    limit 1;



-- Students enrolled in multiple courses :

select s.name ,
		count(e.course_id) as total_courses
	from Enrollments e
    join Students s on e.std_id = s.stdid
    group by s.stdid , s.name
    having count(e.course_id) > 1;
           
	