-- 1: In this challenge, you need to find the average salary
-- for each department and then identify employees who have a salary
-- higher than the average salary in their respective department 
-- using a subquery.

WITH avgSalaryDepartment AS (
  SELECT
    DepartmentID,
    AVG(Salary) as AvgSalary
  FROM Employees
  GROUP BY DepartmentID
)

SELECT
  FirstName,
  LastName,
  DepartmentID,
  Salary
FROM Employees emp
WHERE Salary > (SELECT AvgSalary FROM avgSalaryDepartment WHERE emp.DepartmentID = avgSalaryDepartment.DepartmentID);

-- Challenge #2: In this challenge, you need to find employees 
-- who have the highest salary within each department, excluding the 
-- IT department.

SELECT
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    e.Salary,
    d.DepartmentName
FROM
    Employees e
INNER JOIN
    Departments d
ON
    e.DepartmentID = d.DepartmentID
WHERE
    e.Salary = (
      SELECT
        MAX(Salary)
      FROM Employees e2
      WHERE 1=1
        AND e2.DepartmentID = e.DepartmentID
        AND d.DepartmentName != 'IT'
    );