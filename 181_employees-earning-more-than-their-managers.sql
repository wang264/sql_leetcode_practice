-- 181. Employees Earning More Than Their Managers
-- The Employee table holds all employees including their managers. Every employee has 
-- an Id, and there is also a column for the manager Id.

-- +----+-------+--------+-----------+
-- | Id | Name  | Salary | ManagerId |
-- +----+-------+--------+-----------+
-- | 1  | Joe   | 70000  | 3         |
-- | 2  | Henry | 80000  | 4         |
-- | 3  | Sam   | 60000  | NULL      |
-- | 4  | Max   | 90000  | NULL      |
-- +----+-------+--------+-----------+
-- Given the Employee table, write a SQL query that finds out employees who earn more than
--  their managers. For the above table, Joe is the only employee who earns more than his manager.

-- +----------+
-- | Employee |
-- +----------+
-- | Joe      |
-- +----------+


-- Create table If Not Exists Employee (Id int, Name varchar(255), Salary int, ManagerId int);
-- Truncate table Employee;
-- insert into Employee (Id, Name, Salary, ManagerId) values ('1', 'Joe', '70000', '3');
-- insert into Employee (Id, Name, Salary, ManagerId) values ('2', 'Henry', '80000', '4');
-- insert into Employee (Id, Name, Salary, ManagerId) values ('3', 'Sam', '60000', NULL);
-- insert into Employee (Id, Name, Salary, ManagerId) values ('4', 'Max', '90000', NULL);


SELECT * FROM Employee;

SELECT e1.Name
FROM Employee e1
JOIN Employee e2
ON e1.ManagerID = e2.ID
WHERE e1.Salary > e2.Salary;
