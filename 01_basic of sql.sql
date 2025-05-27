show databases;
create  DATABASE if not exists Nikhil ;
select database();
USE Nikhil;

CREATE TABLE employee(
    EmpId INT AUTO_INCREMENT,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    Age INT NOT NULL,
    Salary INT NOT NULL,
    Location VARCHAR(20) NOT NULL,
    PRIMARY KEY(EmpId)
);
DESC employee;

INSERT INTO employee (FirstName, LastName, Age, Salary, Location)
VALUES 
("Aryan", "kumar", 21, 50000, "Kolkata"), 
("Nikhil", "kumar", 21, 10000000, "Bangaluru"),
("Aryan", "kumar", 21, 50000, "Kolkata"),
("shivam", "kumar", 21, 20000, "Noida"),
("ajay", "kumar", 21, 82000, "Mumbai");

-- insert into employee (LastName , Age, salary,Location) values("Bhatt",29,50000,"gurugram"); here we set contraint--
 select FirstName,LastName from employee;

select FirstName , LastName,salary from employee where salary>=50000 
order by salary  limit 2;

delete from employee where empId =3;
update employee set LastName ="Shaw" where empId =5;
update employee set salary ="80000" where empId =1;
Drop table employee;
show tables;

alter table employee modify firstName varchar(50);

create table course(
	courseId INT AUTO_INCREMENT,
    courseName varchar(50),
    courseInstructor varchar(50),
    primary key(courseId)
);

create table student(
	Learner_Id INT AUTO_INCREMENT,
    LearnerFirstName varchar(20) not null,
    LearnerLastName varchar(20) not null,
    LearnerPhoneNo varchar(10) not null,
    LearnerEmailId varchar(50) ,
    LearnerEnrollmentDate timestamp not null,
    selectedCourse int not null,
    yearsOfExperience int not null,
    LearnerCompany varchar(50),
    sourceOfJoining varchar(50) not null,
    Batch_Start_Date timestamp not null,
    location varchar(50) not null,
    
    primary key(Learner_Id),
    unique key(LearnerEmailId),
    foreign key(selectedCourse) references course(courseId)
    
);
INSERT INTO course (courseName, courseInstructor) VALUES 
('Data Science', 'Dr. Smith'),
('Web Development', 'Ms. Johnson'),
('Machine Learning', 'Dr. Lee'),
('Cloud Computing', 'Mr. Davis'),
('Cyber Security', 'Ms. Patel');

INSERT INTO student (
    LearnerFirstName, LearnerLastName, LearnerPhoneNo, LearnerEmailId,
    LearnerEnrollmentDate, selectedCourse, yearsOfExperience,
    LearnerCompany, sourceOfJoining, Batch_Start_Date, location
) VALUES
('Alice', 'Walker', '9876543210', 'alice@example.com', NOW(), 1, 2, 'TechCorp', 'LinkedIn', '2025-06-01 09:00:00', 'New York'),
('Bob', 'Smith', '9123456780', 'bob@example.com', NOW(), 2, 1, 'InnovateX', 'Referral', '2025-06-05 09:00:00', 'San Francisco'),
('Charlie', 'Brown', '9988776655', 'charlie@example.com', NOW(), 3, 3, 'DevSolutions', 'Website', '2025-06-10 09:00:00', 'Chicago'),
('Diana', 'Prince', '9345678901', 'diana@example.com', NOW(), 4, 4, 'SecureNet', 'Event', '2025-06-15 09:00:00', 'Los Angeles'),
('Ethan', 'Hunt', '9871234560', 'ethan@example.com', NOW(), 5, 5, 'CloudBase', 'Ad Campaign', '2025-06-20 09:00:00', 'Seattle');

-- Data Analysis [Employee, course, student]

select * from employee
order by salary desc 
limit 1;

select * 
from employee
where salary=(
	select max(salary)
    from employee
);
SELECT * FROM student;
desc student;
select count(*) as total_Num_employee from employee;
select max(salary) as maximum_salary from employee;
select * from employee;




-- Q.Give me the record of the employee getting highest salary and age higher than 30
select * from employee 
where
Age>22
order by salary desc limit 1;  

--  Q . Display the number of enrollement in  student 
select count(*) as LearnerEnrollmentDate from student;
select count(*) as LearnerEnrollmentDate from student;
select count(selectedCourse) as LearnerEnrollmentDate from student;

-- 4.Display the number of enrollement for the courseid =3
select count(*) as num_of_enrollments from student where selectedCourse = 3;

-- 5. count the number of learners enrolled in month of may
SELECT COUNT(*) 
FROM student 
WHERE DATE(LearnerEnrollmentDate) = '2025-05-11';


-- 6. update the smith date with years of expenience 1 and leraner compony "amazon" 
select * from student;
SELECT Learner_Id FROM student 
WHERE LearnerLastName = 'Walker' AND yearsOfExperience = 2;
UPDATE student 
SET LearnerCompany = 'CloudBase' , yearsOfExperience =1
WHERE Learner_Id = 1;

-- 7. count the number of companies where learners currently doing thier job
select count( distinct LearnerCompany) from student;

