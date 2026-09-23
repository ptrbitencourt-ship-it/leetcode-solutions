# Write your MySQL query statement below

SELECT EmailPerson.email AS Email
FROM Person AS EmailPerson
GROUP BY EmailPerson.email
HAVING COUNT(*) >= 2;