-- Write your PostgreSQL query statement below

WITH validos AS (
    SELECT
        id,
        visit_date,
        people,
        ROW_NUMBER() OVER (ORDER BY id) AS rn
    FROM Stadium
    WHERE people >= 100
),

sequencias AS (
    SELECT
        id,
        visit_date,
        people,
        id - rn AS grupo
    FROM validos
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
WHERE S.grupo IN (
    SELECT grupo
    FROM grupos_validos
)
ORDER BY S.visit_date ASC;
