-- Task 2
use StudentManagement;

-- Create Courses Table :
create table Courses(
	id int primary key,
    name varchar(50)
    );
    
-- Insert Courses :   
insert into Courses 
	values(101,'Database Management'),
		   (102,'Data Structure'),
           (103,'Operating System');
           
-- Create Enrollments Table :
create table Enrollments(
	std_id int,
    course_id int,
    grade int,
    foreign key (std_id) references Students(stdid),
    foreign key (course_id) references Courses(id)
    );

-- Insert Enrollments :
insert into Enrollments
	values(1,101,85),
		   (2,101,35),
           (3,102,72),
           (4,102,95),
           (6,103,55),
           (7,103,90),
           (8,101,88),
           (9,102,45),
           (10,103,80);
           
-- =======================
-- Requied Queries
-- =======================

-- List all students enrolled in each course :
select c.name as Courses,
		s.name as Students,
        e.grade
	from Enrollments e
    join Students s
    on e.std_id = s.stdid
    join Courses c
    on e.course_id = c.id
    order by c.name;

-- Find average grade per course :
select c.name as Courses,
	avg(e.grade) as avg_grade
    from Enrollments e
    join Courses c
    on e.course_id = c.id
    group by c.name;

-- Find top 3 students overall :
select s.name as Students,
	avg(e.grade) as avg_grade
    from Students s
    join Enrollments e
    on s.stdid = e.std_id
    group by s.stdid , s.name
    order by avg_grade desc
    limit 3;
-- Count students who failed (grade < 40) :
select count(*) as failed_students
	from Enrollments
    where grade < 40;
           
	