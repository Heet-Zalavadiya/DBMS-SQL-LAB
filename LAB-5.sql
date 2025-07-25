USE CSE_3A_104;

--SELECT * FROM DEPOSIT;

EXEC SP_RENAME 'DEPOSIT','DEPOSIT_DETAIL';

--1. Rename Column ADATE to AOPENDATE OF DEPOSIT_DETAIL table. 
	SELECT * FROM DEPOSIT_DETAIL;
	EXEC SP_RENAME 'DEPOSIT_DETAIL.ADATE','AOPENDATE';
--2. Delete Column AOPENDATE from the DEPOSIT_DETAIL table. 
	ALTER TABLE DEPOSIT_DETAIL
	DROP COLUMN AOPENDATE;
--3. Rename Column CNAME to CustomerName. 
	EXEC SP_RENAME 'DEPOSIT_DETAIL.CNAME','CustomerName';
--4. Add Column country.
	ALTER TABLE DEPOSIT_DETAIL
	ADD COUNTRY VARCHAR(10);

--Part � C: 

CREATE TABLE STUDENT_DETAIL(
	Enrollment_No VARCHAR(20),
	Name VARCHAR(25), 
	CPI DECIMAL(5,2), 
	Birthdate DATETIME
);

SELECT * FROM STUDENT_DETAIL;

--1. Add two more columns City VARCHAR (20) (Not null) and Backlog INT (Null).
	ALTER TABLE STUDENT_DETAIL
	ADD CITY VARCHAR(20) NOT NULL,
		BACKLOG INT;
--2. Add column department VARCHAR (20) Not Null. 
	ALTER TABLE STUDENT_DETAIL
	ADD DEPARTMENT VARCHAR(20) NOT NULL;
--3. Change the size of NAME column of student_detail from VARCHAR (25) to VARCHAR (35).
	ALTER TABLE STUDENT_DETAIL
	ALTER COLUMN Name VARCHAR(35);
--4. Change the data type DECIMAL to INT in CPI Column. 
	ALTER TABLE STUDENT_DETAIL
	ALTER COLUMN CPI INT;
--5. Delete Column City from the student_detail table. 
	ALTER TABLE STUDENT_DETAIL
	DROP COLUMN CITY;
--6. Rename Column Enrollment_No to ENO. 
	EXEC SP_RENAME 'STUDENT_DETAIL.ENROLLMENT_NO','ENO';
--7. Change name of table student_detail to STUDENT_MASTER. 
	EXEC SP_RENAME 'STUDENT_DETAIL','STUDENT_MASTER';

--DELETE, Truncate, Drop Operation 
--Part � A:
	SELECT * FROM DEPOSIT_DETAIL;
--1. Delete all the records of DEPOSIT_DETAIL table having amount less than and equals to 4000.
	DELETE FROM DEPOSIT_DETAIL
	WHERE AMOUNT <= 4000;
--2. Delete all the accounts CHANDI BRANCH. 
	DELETE FROM DEPOSIT_DETAIL
	WHERE BNAME = 'CHANDI';
--3. Delete all the accounts having account number (ANO) is greater than 102 and less than 105. 
	DELETE FROM DEPOSIT_DETAIL
	WHERE ACTNO > 102 AND ACTNO < 105;
--4. Delete all the accounts whose branch is �AJNI� or �POWAI� 
	DELETE FROM DEPOSIT_DETAIL
	WHERE BNAME IN('AJNI','POWAI');
--5. Delete all the accounts whose account number is NULL. 
	DELETE FROM DEPOSIT_DETAIL
	WHERE ACTNO IS NULL;
--6. Delete all the remaining records using Delete command. 
	DELETE FROM DEPOSIT_DETAIL;
--7. Delete all the records of Deposit_Detail table. (Use Truncate) 
	TRUNCATE TABLE DEPOSIT_DETAIL;
--8. Remove Deposit_Detail table. (Use Drop) 
	DROP TABLE DEPOSIT_DETAIL;

--Part � B:
CREATE TABLE EMPLOYEE_MASTER(
	EmpNo INT, 
	EmpName VARCHAR(25), 
	JoiningDate DATETIME, 
	Salary DECIMAL (8,2), 
	City VARCHAR(20) 
);

INSERT INTO EMPLOYEE_MASTER (EmpNo, EmpName, JoiningDate, Salary, City)
			VALUES (101, 'Keyur', '2005-1-02', 12000.00, 'Rajkot'), 
				   (102, 'Hardik', '2015-2-04', 14000.00, 'Ahmedabad' ),
				   (103, 'Kajal', '2014-3-06', 15000.00, 'Baroda'), 
				   (104, 'Bhoomi', '2023-6-05', 12500.00, 'Ahmedabad'), 
				   (105, 'Harmit', '2015-2-04', 14000.00, 'Rajkot'), 
				   (106, 'Mitesh', '2025-9-01', 5000.00, 'Jamnagar'), 
				   (107, 'Meera', Null, 7000.00, 'Morbi'), 
				   (108, 'Kishan',' 2006-2-03', 10000.00, NULL);

SELECT * FROM EMPLOYEE_MASTER;

----1. Delete all the records of Employee_MASTER table having salary greater than and equals to 14000. 
		DELETE FROM EMPLOYEE_MASTER
		WHERE SALARY >= 14000;
----2. Delete all the Employees who belongs to �RAJKOT� city. 
		DELETE FROM EMPLOYEE_MASTER
		WHERE CITY = 'RAJKOT';
----3. Delete all the Employees who joined after 1-1-2007.
		DELETE FROM EMPLOYEE_MASTER
		WHERE JoiningDate > '2007-01-01';
----4. Delete the records of Employees whose joining date is null and Name is not null. 
		DELETE FROM EMPLOYEE_MASTER
		WHERE JoiningDate IS NULL AND EMPNAME IS NOT NULL;
----5. Delete the records of Employees whose salary is 50% of 20000. 
		DELETE FROM EMPLOYEE_MASTER
		WHERE Salary = 10000; 
----6. Delete the records of Employees whose City Name is not empty. 
		DELETE FROM EMPLOYEE_MASTER
		WHERE CITY IS NOT NULL;
----7. Delete all the records of Employee_MASTER table. (Use Truncate) 
		TRUNCATE TABLE EMPLOYEE_MASTER;
----8. Remove Employee_MASTER table. (Use Drop)
		DROP TABLE EMPLOYEE_MASTER;