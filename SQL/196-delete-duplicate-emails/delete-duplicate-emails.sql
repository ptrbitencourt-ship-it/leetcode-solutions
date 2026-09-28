# Write your MySQL query statement below

DELETE p
FROM Person P
JOIN (
    SELECT
        id,
        DENSE_RANK() OVER (
            PARTITION BY email
            ORDER BY id
        ) AS ranking 
    FROM Person
) R
    ON P.id = R.id
WHERE R.ranking > 1;