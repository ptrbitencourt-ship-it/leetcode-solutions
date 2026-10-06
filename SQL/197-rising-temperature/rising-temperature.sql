# Write your MySQL query statement below

SELECT W.id
FROM Weather W
JOIN Weather T
    ON T.recordDate = DATE_SUB(W.recordDate, INTERVAL 1 DAY)
WHERE W.temperature > T.temperature;