# Write your MySQL query statement below

SELECT ROUND(
    COUNT(DISTINCT A.player_id) /
    (SELECT COUNT(DISTINCT player_id)
     FROM Activity),
    2
) AS fraction
FROM Activity AS A
JOIN (
    SELECT
        player_id,
        MIN(event_date) AS firstLogin
    FROM Activity
    GROUP BY player_id
) AS F
    ON A.player_id = F.player_id
    AND A.event_date = DATE_ADD(F.firstLogin, INTERVAL 1 DAY);