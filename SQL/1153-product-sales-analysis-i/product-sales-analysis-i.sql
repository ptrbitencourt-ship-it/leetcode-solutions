# Write your MySQL query statement below

SELECT product_name, year, price
FROM Sales V
LEFT JOIN Product P
    ON V.product_id = P.product_id