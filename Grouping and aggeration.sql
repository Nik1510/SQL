show databases;
use nikhil;
show tables;
select * from student;

-- count of the number of students who joined the course via linkedin , Referral,Event
 SELECT sourceOfJoining, count(*) as num_of_student
 from student
 GROUP BY sourceOfJoining;
 
 -- Grouping via sourceOfJoining and the location
  SELECT sourceOfJoining,Location, count(*) as num_of_student
 from student
 GROUP BY sourceOfJoining,Location;
 
 -- Corresponding to each course , how many students have enrolled
 select selectedCourse,count(*) AS num_of_students
 From student
 group by selectedCourse;
 
 select * from course;
 
 -- corrsponding to individual source of joinning , give the maximim years of exprenience  any preson from linkedin and 
select sourceOfJoining,max(yearsOfExperience) as max_years_ago
from student
group by sourceOfJoining;

-- for min Years
 
 select sourceOfJoining,min(yearsOfExperience) as min_years_ago
from student
group by sourceOfJoining;

 --  corrsponding to individual source of joinning , give the avg years of exprenience  any preson from linkedin and 
 select sourceOfJoining,avg(yearsOfExperience) as average_years_of_exp
 from student
 group by sourceOfJoining;

--  corrsponding to individual source of joinning , give the sum years of exprenience  any preson from linkedin and 
  select sourceOfJoining,sum(yearsOfExperience) as average_years_of_exp
 from student
 group by sourceOfJoining;
 
 -- display the report of the students who have joined the course via more than 1 source of joining
 select sourceOfJoining,count(*) as mutiple_source
from student
group by sourceOfJoining
HAVING mutiple_source>2;

-- display the report of the students who have joined the course via linkedIn
-- Method 1.
SELECT sourceOfJoining, COUNT(*) AS LinkedIn_joinee
FROM student
WHERE sourceOfJoining = 'LinkedIn'
GROUP BY sourceOfJoining;

-- Method 2
SELECT sourceOfJoining, COUNT(*) AS LinkedIn_joinee
FROM student
GROUP BY sourceOfJoining
having sourceOfJoining='LinkedIn';


-- Inserting 4 more data Entries
INSERT INTO student (
    LearnerFirstName, LearnerLastName, LearnerPhoneNo, LearnerEmailId,
    LearnerEnrollmentDate, selectedCourse, yearsOfExperience,
    LearnerCompany, sourceOfJoining, Batch_Start_Date, location
) VALUES
('Tushal', 'Kumar', '9865432710', 'tushal@example.com', '2024-01-21', 1, 2, 'TechCorp', 'LinkedIn', '2025-06-01 09:00:00', 'New York'),
('Rahul', 'Kumar', '9876544710', 'rahul@example.com', '2024-02-21', 1, 2, 'TechCorp', 'LinkedIn', '2025-06-01 09:00:00', 'Denmark'),
('Abhishek', 'Kumar', '9876532710', 'abhishek@example.com', '2024-05-27', 1, 2, 'TechCorp', 'Event', '2025-06-01 09:00:00', 'New Delhi');

-- Update the course 

insert into course(courseId,courseName,courseInstructor) values(6,'excel','priya'),(7,'DSA','Kunal');

select * from course;

-- display all the course which doesnot include excel

select * from course
where courseName Not Like "%Excel%";

select * from student 
where yearsOfExperience between 1 and 3;


