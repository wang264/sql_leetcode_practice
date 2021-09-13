

# SQL subquery执行顺序要看他是correlated Subquery 还是 noncorrelated Subquery.
# 如果哦是noncorrelated, 那先执行。如果是correlated的，那For each row of the main query, we run the sub query.


# For Example, Leetcode 184 Department Hightest Salary
#
# SELECT d.Name Department, e.Name Employee, e.Salary as Salary
# FROM Employee e, Department d
# WHERE e.DepartmentId = d.Id
# AND e.Salary =
# (
# 	SELECT MAX(Salary)
#     FROM Employee AS t
#     WHERE t.DepartmentId = e.DepartmentId
# );

# this is correlated Subquery, we dont know e.DepartmentID in advance.
# but if we change it to the following, we it will be uncorrelated.

# SELECT d.Name Department, e.Name Employee, e.Salary as Salary
# FROM Employee e, Department d
# WHERE e.DepartmentId = d.Id
# AND e.Salary =
# (
# 	SELECT MAX(Salary)
#     FROM Employee AS t
#     WHERE t.DepartmentId = "IT"
# );
