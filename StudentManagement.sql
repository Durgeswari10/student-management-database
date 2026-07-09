-- Create the Database :
create database StudentManagement;
	
-- Use the Database :
use StudentManagement;

 -- Create the Students table :
create table Students (
		stdid int primary key auto_increment,
		name varchar(20),
		gender char(1),
		age int,
		grade varchar(2),
		mathScore int,
		scienceScore int,
		englishScore int
		);

-- Insert 10 records :
insert into Students(name,gender,age,grade,
		mathScore,scienceScore,englishScore)
        values
        ('Amit','male',18,'A',85,90,88),
        ('Priya','female',17,'B',78,82,80),
        ('Rahul','male',19,'A',92,89,95),
        ('Sneha','female',18,'C',65,70,72),
        ('Rohan','male',17,'B',88,84,81),
        ('Anjali','female',18,'A',95,91,94),
        ('Vikram','male',19,'C',60,68,70),
        ('Neha','female',17,'B',82,79,85),
        ('Karan','male',18,'A',90,87,89),
        ('Pooja','female',19,'B',76,81,78);  

-- show all student details :
select * from Students;

-- Average score in each subject :
select avg(mathScore) as AvgMath,
	    avg(scienceScore) as AvgScience,
   	    avg(englishScore) as AvgEnglish
   	    from Students;

-- Top performer (highest total score) :
 select * , (mathScore + scienceScore + englishScore)
		as TotalScore 
    		from Students
   		 order by TotalScore desc
   		 limit 1;

-- Average score by gender :
select grade , count(*) as TotalStudents
		from Students
   		 group by grade;

-- Students with mathScore > 80 :
select * from Students where mathScore > 80;

-- Update a Student's grade :
update Students set grade = 'A' where name = 'Priya';

-- Show the updated data :
select * from Students where name='Priya';