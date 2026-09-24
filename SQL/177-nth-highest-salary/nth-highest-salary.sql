CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
    RETURN (
        # Write your MySQL query statement below.

        SELECT salary
        FROM (
            SELECT
                salary,
                DENSE_RANK() OVER (ORDER BY salary DESC) AS posicao
            FROM (
                SELECT DISTINCT salary
                FROM Employee
            ) AS salarios
        ) AS ranking
        WHERE posicao = N
        
    );
END