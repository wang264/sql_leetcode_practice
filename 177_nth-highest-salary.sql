-- 177. Nth Highest Salary
-- Medium

-- Write a SQL query to get the nth highest salary from the Employee table.
-- 
-- +----+--------+
-- | Id | Salary |
-- +----+--------+
-- | 1  | 100    |
-- | 2  | 200    |
-- | 3  | 300    |
-- +----+--------+
-- For example, given the above Employee table, the nth highest salary where n = 2 is 200. If there is no nth highest salary, then the query should return null.
-- 
-- +------------------------+
-- | getNthHighestSalary(2) |
-- +------------------------+
-- | 200                    |
-- +------------------------+


-- Create table If Not Exists Employee (Id int, Salary int);
-- Truncate table Employee;
-- insert into Employee (Id, Salary) values ('1', '100');
-- insert into Employee (Id, Salary) values ('2', '200');
-- insert into Employee (Id, Salary) values ('3', '300');
-- insert into Employee (Id, Salary) values ('4', '200');
-- insert into Employee (Id, Salary) values ('5', '300');

-- insert into Employee (Id, Salary) values ('6', '600');
-- insert into Employee (Id, Salary) values ('7', '700');
-- insert into Employee (Id, Salary) values ('8', '900');
-- insert into Employee (Id, Salary) values ('9', '800');
-- insert into Employee (Id, Salary) values ('10', '1000');

use leet_code;


CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
SET N = N-1
  RETURN
  (
  SELECT DISTINCT Salary
  FROM Employee ORDER by Salary DESC
  LIMIT N,1);
END










