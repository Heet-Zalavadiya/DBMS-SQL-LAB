USE CSE_3A_104;

CREATE TABLE EMP(
	EID INT, 
	EName VARCHAR(20),
	Department VARCHAR(10),
	Salary DECIMAL (8,2),
	JoiningDate DATETIME,
	City VARCHAR(20),
	Gender VARCHAR(10)
);

INSERT INTO EMP(EID, EName, Department, Salary, JoiningDate, City, Gender) 
VALUES (101, 'Rahul', 'Admin', 56000, '1990-01-01', 'Rajkot', 'Male'),
	   (102, 'Hardik', 'IT', 18000, '1990-09-25', 'Ahmedabad', 'Male'),
	   (103, 'Bhavin', 'HR', 25000, '1991-05-14', 'Baroda', 'Male'),
	   (104, 'Bhoomi', 'Admin', 39000, '1991-02-08', 'Rajkot', 'Female'),
	   (105, 'Rohit', 'IT', 17000, '1990-07-23', 'Jamnagar', 'Male'),
	   (106, 'Priya', 'IT', 9000, '1990-10-18', 'Ahmedabad', 'Female'),
	   (107, 'Bhoomi', 'HR', 34000, '1991-12-25', 'Rajkot', 'Female');

SELECT * FROM EMP;

--Part – A:
--1. Display the Highest, Lowest, Label the columns Maximum, Minimum respectively.
	SELECT 
		MAX(SALARY) AS MAXIMUM,
		MIN(SALARY) AS MINIMUM
	FROM EMP;
--2. Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal,
--respectively.
	SELECT
		SUM(SALARY) AS TOTAL_SAL,
		AVG(SALARY) AS AVERAGE_SAL
	FROM EMP;
--3. Find total number of employees of EMPLOYEE table.
	SELECT
		COUNT(*) AS TOTAL_EMP
	FROM EMP;
--4. Find highest salary from Rajkot city.
	SELECT
		MAX(SALARY) AS HIGHEST
	FROM EMP
	WHERE CITY = 'RAJKOT';

--5. Give maximum salary from IT department.
	SELECT 
		MAX(SALARY) AS MAX_IT
	FROM EMP
	WHERE Department = 'IT';
--6. Count employee whose joining date is after 8-feb-91.
	SELECT
		COUNT(*) 
	FROM EMP
	WHERE JoiningDate > '1991-02-08';
--7. Display average salary of Admin department.
	SELECT 
		AVG(SALARY)
	FROM EMP
	WHERE Department = 'ADMIN';
--8. Display total salary of HR department.
	SELECT
		SUM(SALARY)
	FROM EMP
	WHERE Department = 'HR';
--9. Count total number of cities of employee without duplication.
	SELECT
		COUNT(DISTINCT CITY) 
	FROM EMP;
--10. Count unique departments.
	SELECT
		COUNT(DISTINCT DEPARTMENT)
	FROM EMP;
--11. Give minimum salary of employee who belongs to Ahmedabad.
	SELECT
		MIN(SALARY)
	FROM EMP
	WHERE CITY = 'AHMEDABAD';
--12. Find city wise highest salary.
	SELECT 
		MAX(SALARY) AS MAX_SALARY
	FROM EMP
	GROUP BY CITY;
--13. Find department wise lowest salary.
	SELECT DEPARTMENT,
		MIN(SALARY) AS MIN_SALARY
	FROM EMP
	GROUP BY Department;

--14. Display city with the total number of employees belonging to each city.
	SELECT CITY,
		COUNT(ENAME) 
	FROM EMP
	GROUP BY CITY;
--15. Give total salary of each department of EMP table.
	SELECT DEPARTMENT,
		SUM(SALARY)
	FROM EMP
	GROUP BY DEPARTMENT;
--16. Give average salary of each department of EMP table without displaying the respective department
--name.
	SELECT 
		AVG(SALARY)
	FROM EMP
	GROUP BY Department;
--17. Count the number of employees for each department in every city.
	SELECT DEPARTMENT,CITY,
		COUNT(ENAME)
	FROM EMP
	GROUP BY Department,CITY;
--18. Calculate the total salary distributed to male and female employees.
	SELECT GENDER,
		SUM(SALARY)
	FROM EMP
	GROUP BY GENDER;
--19. Give city wise maximum and minimum salary of female employees.
	SELECT CITY,
		MAX(SALARY) AS MAX_SALARY,
		MIN(SALARY) AS MIN_SALARY
	FROM EMP
	WHERE GENDER = 'FEMALE'
	GROUP BY CITY;
--20. Calculate department, city, and gender wise average salary.
	SELECT DEPARTMENT,CITY,GENDER,
		AVG(SALARY) AS AVG_SAL
	FROM EMP
	GROUP BY Department,CITY,Gender;
--Part – B:
--1. Count the number of employees living in Rajkot.
	SELECT CITY,
		COUNT(ENAME) AS NO_EMP
	FROM EMP
	WHERE CITY = 'RAJKOT'
	GROUP BY CITY;
--2. Display the difference between the highest and lowest salaries. Label the column DIFFERENCE.
	SELECT
		MAX(SALARY) - MIN(SALARY) AS DIFFERENCE
	FROM EMP;
--3. Display the total number of employees hired before 1st January, 1991.
	SELECT 
		COUNT(ENAME) AS EMPLOYEE
	FROM EMP
	WHERE JoiningDate < '1991-01-01';
--Part – C:
--1. Count the number of employees living in Rajkot or Baroda.
	SELECT 
		COUNT(ENAME) AS EMPLOYEE
	FROM EMP
	WHERE CITY = 'RAJKOT' OR CITY = 'BARODA';
--2. Display the total number of employees hired before 1st January, 1991 in IT department.
	SELECT DEPARTMENT,
		COUNT(ENAME) AS EMPLOYEE
	FROM EMP
	WHERE JoiningDate < '1991-01-01' AND Department = 'IT'
	GROUP BY DEPARTMENT;
--3. Find the Joining Date wise Total Salaries.
	SELECT JOININGDATE,
		SUM(SALARY) AS SAL
	FROM EMP
	GROUP BY JoiningDate;
--4. Find the Maximum salary department & city wise in which city name starts with ‘R’.
	SELECT CITY,DEPARTMENT,
		MAX(SALARY) AS MAX_SAL
	FROM EMP
	WHERE CITY LIKE 'R%'
	GROUP BY CITY,Department;