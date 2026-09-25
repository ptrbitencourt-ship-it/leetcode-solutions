# Write your MySQL query statement below

SELECT
    D.name AS Department,
    R.name AS Employee,
    R.salary AS Salary
FROM (
    SELECT
        E.id,
        E.name,
        E.salary,
        E.departmentId,
        DENSE_RANK() OVER (
            PARTITION BY E.departmentId
            ORDER BY E.salary DESC
        ) AS ranking
    FROM Employee E
) AS R
INNER JOIN Department D
    ON R.departmentId = D.id
WHERE R.ranking = 1;