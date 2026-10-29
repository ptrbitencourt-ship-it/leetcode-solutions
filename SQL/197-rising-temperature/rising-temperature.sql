-- Write your PostgreSQL query statement below

SELECT Today.id
FROM Weather AS Today
JOIN Weather AS Yesterday
    ON Today.recordDate = Yesterday.recordDate + INTERVAL '1 day'
WHERE Today.temperature > Yesterday.temperature;