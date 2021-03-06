-- 1270. All People Report to the Given Manager
-- Medium

-- Table: Employees

-- +---------------+---------+
-- | Column Name      | Type    |
-- +---------------+---------+
-- | employee_id        | int     |
-- | employee_name  | varchar |
-- | manager_id         | int     |
-- +---------------+---------+
-- employee_id is the primary key for this table.
-- Each row of this table indicates that the employee with ID employee_id and name employee_name reports his work to his/her direct manager with manager_id
-- The head of the company is the employee with employee_id = 1.
--  

-- Write an SQL query to find employee_id of all employees that directly or indirectly report their work to the head of the company.

-- The indirect relation between managers will not exceed 3 managers as the company is small.

-- Return result table in any order without duplicates.

-- The query result format is in the following example:

-- Employees table:
-- +-------------+---------------+------------+
-- | employee_id | employee_name | manager_id |
-- +-------------+---------------+------------+
-- | 1           | Boss          | 1          |
-- | 3           | Alice           | 3          |
-- | 2           | Bob            | 1          |
-- | 4           | Daniel        | 2          |
-- | 7           | Luis            | 4          |
-- | 8           | Jhon           | 3          |
-- | 9           | Angela        | 8          |
-- | 77         | Robert        | 1          |
-- +-------------+---------------+------------+

-- Result table:
-- +-------------+
-- | employee_id |
-- +-------------+
-- | 2           |
-- | 77         |
-- | 4           |
-- | 7           |
-- +-------------+

-- The head of the company is the employee with employee_id 1.
-- The employees with employee_id 2 and 77 report their work directly to the head of the company.
-- The employee with employee_id 4 report his work indirectly to the head of the company 4 --> 2 --> 1. 
-- The employee with employee_id 7 report his work indirectly to the head of the company 7 --> 4 --> 2 --> 1.
-- The employees with employee_id 3, 8 and 9 don't report their work to head of company directly or indirectly. 


-- Create table If Not Exists Employees (employee_id int, employee_name varchar(30), manager_id int);
-- Truncate table Employees;
-- insert into Employees (employee_id, employee_name, manager_id) values ('1', 'Boss', '1');
-- insert into Employees (employee_id, employee_name, manager_id) values ('3', 'Alice', '3');
-- insert into Employees (employee_id, employee_name, manager_id) values ('2', 'Bob', '1');
-- insert into Employees (employee_id, employee_name, manager_id) values ('4', 'Daniel', '2');
-- insert into Employees (employee_id, employee_name, manager_id) values ('7', 'Luis', '4');
-- insert into Employees (employee_id, employee_name, manager_id) values ('8', 'John', '3');
-- insert into Employees (employee_id, employee_name, manager_id) values ('9', 'Angela', '8');
-- insert into Employees (employee_id, employee_name, manager_id) values ('77', 'Robert', '1');

## t3: directly report to employee_id 1
## t2: directly report to t3
## t1: directly report to t2


Select t1.employee_id 
From Employees t1
Left Join  Employees t2 on t1.manager_id = t2.employee_id
Left Join  Employees t3 on t2.manager_id = t3.employee_id
Where t1.employee_id <>1
And t3.manager_id = 1;








