CREATE DATABASE pay_roll_db;
USE payroll_db;
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    dept_id INT,
    designation VARCHAR(50),
    basic_salary DECIMAL(10,2),
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);
CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY,
    emp_id INT,
    attendance_date DATE,
    status VARCHAR(10),
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);
CREATE TABLE Leave_Records (
    leave_id INT PRIMARY KEY,
    emp_id INT,
    leave_type VARCHAR(30),
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);
INSERT INTO Department VALUES
(1,'IT'),
(2,'HR'),
(3,'Finance');

INSERT INTO Employee VALUES
(101,'Rahul',1,'Java Developer',50000),
(102,'Priya',2,'HR Executive',45000),
(103,'Arun',1,'Frontend Developer',40000);

INSERT INTO Attendance VALUES
(1,101,'2026-06-01','Present'),
(2,102,'2026-06-01','Present'),
(3,103,'2026-06-01','Absent');

SELECT * FROM Employee;
SELECT e.emp_name, d.dept_name
FROM Employee e
JOIN Department d
ON e.dept_id = d.dept_id;

SELECT *
FROM Employee
ORDER BY basic_salary DESC
LIMIT 1;

SELECT d.dept_name, COUNT(e.emp_id) AS total_employees
FROM Department d
LEFT JOIN Employee e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

CREATE VIEW Employee_Details AS
SELECT e.emp_id,
       e.emp_name,
       d.dept_name,
       e.designation,
       e.basic_salary
FROM Employee e
JOIN Department d
ON e.dept_id = d.dept_id;

DELIMITER //

CREATE PROCEDURE GetEmployeeSalary(IN employeeId INT)
BEGIN
    SELECT emp_name, basic_salary
    FROM Employee
    WHERE emp_id = employeeId;
END //

DELIMITER ;

CALL GetEmployeeSalary(101);


