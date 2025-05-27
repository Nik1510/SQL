use Nikhil;
select * from employee;
-- For each location what is the count each employee and avg salary of the employee in those location 
select Location , count(*) as Location_of_employee,
avg(salary) as AVG_Salary
From Employee
group by location;

select Salary, AVG(Salary) as AVG_SALARY,
 COUNT(*) AS Employee_Count
from Employee
group by salary;

-- contining the above question , also display firstName and LastName corresponding to each record 

SELECT Employee.FirstName, Employee.LastName, Employee.Location, temp.Total, temp.AVG_Salary
FROM Employee
JOIN (
    SELECT Location, COUNT(*) AS Total, AVG(Salary) AS AVG_Salary
    FROM Employee
    GROUP BY Location
) AS temp
ON Employee.Location = temp.Location;

-- optimize the above query via window function 
select firstName , LastName, Location ,
count(Location) Over (partition by Location) AS total,
avg(salary) Over(partition by Location) as Avg_salary
From Employee;

INSERT INTO employee (FirstName, LastName, Age, Salary, Location)
VALUES 
("Rahul", "Shaw", 25, 500000, "Nodia"), 
("Raj", "Shaw", 21, 500000, "Gurgram");

-- on Basic of of the salary make priority table

-- Differnce between row_number() vs rank() vs denserank() 


Select FirstName,LastName, Salary,
row_number() over(order by Salary desc) as Priority_EMP
From employee;

Select FirstName,LastName, Salary,
RANK() over(order by Salary desc) as Priority_EMP
From employee;

Select FirstName,LastName, Salary,
dense_rank() over(order by Salary desc) as Priority_EMP
From employee;

-- highest salary
SELECT FirstName, LastName, Salary
FROM Employee
ORDER BY Salary DESC
LIMIT 1;


--  Give the record of the employee having the second highest salary

select * from 
(select FirstName , LastName , Salary,
dense_rank() over(order by salary desc) as Priority_Emp
From Employee) as temp
where Priority_Emp=2;


-- give me the first employee having second highest salary
select * from 
(select FirstName , LastName , Salary,
row_number() over(order by salary desc) as Priority_Emp
From Employee) as temp
where Priority_Emp=2;

-- specify the details  salary people in each location 

select FirstName , LastName , Salary , Location ,
row_number() over (partition by Location Order by salary desc) as Priority_Emp
From employee;


-- specify the details highest salary people in each location 

select * from 
(select FirstName, LastName, Salary, Location,
row_number() over(partition by Location order by Salary DESC) as Highest_Salary
From Employee 
)as temp
where Highest_Salary = 1;