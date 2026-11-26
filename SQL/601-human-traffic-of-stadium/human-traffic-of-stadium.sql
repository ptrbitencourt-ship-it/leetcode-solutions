-- Write your PostgreSQL query statement below

WITH sequencias AS (
    SELECT
        id,
        visit_date,
        people,
        id - ROW_NUMBER() OVER (ORDER BY id) AS grupo
    FROM Stadium
    WHERE people >= 100
),

grupos_validos AS (
    SELECT grupo
    FROM sequencias
    GROUP BY grupo
    HAVING COUNT(*) >= 3
)

SELECT
    S.id,
    S.visit_date,
    S.people
FROM sequencias S
JOIN grupos_validos G
    ON G.grupo = S.grupo
ORDER BY S.visit_date ASC;