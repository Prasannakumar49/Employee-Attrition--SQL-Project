SELECT * FROM employee_attrition_project.employee_attrition;

-- Taking a look at our dataset --
SELECT * FROM employee_attrition;


-- SQL query to find details of employee under attrition having 5+ years of experience and between the age group of 27 - 55 --
SELECT * FROM employee_attrition
WHERE YearsAtCompany > 5 
AND ï»¿Age BETWEEN 27 AND 55 ;


--  To check then total count of the dataset under the above condition we use --
SELECT COUNT(*) FROM employee_attrition
WHERE YearsAtCompany > 5 
AND ï»¿Age BETWEEN 27 AND 55 ;

-- Fetch the details of employees having maximum and minimum salary working in different departments who received less than 13% salary hike --
SELECT department,MIN(MonthlyIncome),MAX(MonthlyIncome)
FROM employee_attrition 
WHERE PercentSalaryHike < 13
GROUP BY department;


-- Calculate the average monthly income of all the employees who worked more than 3 years whose educational background  is medical --
SELECT avg(MonthlyIncome)
FROM employee_attrition
WHERE YearsAtCompany >3 AND 
EducationField = 'Medical';

-- identify the total number of male and female employee under attrition whose marital status is married and haven't received promotion in the last 2 years--
SELECT Gender,COUNT(EmployeeNumber)
FROM employee_attrition
WHERE MaritalStatus = 'Married'
AND YearsSinceLastPromotion = '2'
GROUP BY Gender;


-- identify the total number of male and female employee under attrition whose marital status is married and --
-- haven't received promotion in the last 2 years where attrition is 'yes'--
SELECT Gender,COUNT(EmployeeNumber)
FROM employee_attrition
WHERE MaritalStatus = 'Married'
AND YearsSinceLastPromotion = '2'
and Attrition = 'yes'
GROUP BY Gender;


-- Employees with max performance rating but no promotion for 4 years and above(use of sub query)--

select * 
from employee_attrition
where PerformanceRating = (select max(PerformanceRating) from employee_attrition)
and YearsSinceLastPromotion >= 4;

-- who has max and min percentage of salary hike--

select YearsAtCompany,
	   PerformanceRating,
       YearsSinceLastPromotion,
       max(PercentSalaryHike),
       min(PercentSalaryHike)
from employee_attrition
group by YearsAtCompany, PerformanceRating,YearsSinceLastPromotion
order by max(PercentSalaryHike) desc,
         min(PercentSalaryHike) asc;
         
-- Selecting distinct departments--

select distinct Department
from employee_attrition;

-- Employee working overtime but given a minimum salary hike and are more than 5 years within the company--

select *
from employee_attrition
where OverTime = 'yes'
and PercentSalaryHike = ( select (min(PercentSalaryHike)) from employee_attrition)
and YearsAtCompany > 5
and Attrition = 'yes';

select *
from employee_attrition
where OverTime = 'yes'
and PercentSalaryHike = ( select (max(PercentSalaryHike)) from employee_attrition)
and YearsAtCompany < 5;

select *
from employee_attrition
where OverTime = 'no'
and PercentSalaryHike = ( select (max(PercentSalaryHike)) from employee_attrition)
and YearsAtCompany < 5;

select MaritalStatus,
       max(RelationshipSatisfaction),
       min(RelationshipSatisfaction)
from employee_attrition
group by MaritalStatus;


