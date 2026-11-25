-- Write your code here

-- Return the customer ID, first name, last name, and total quantity purchased for each qualifying customer.
SELECT c.customer_id, c.first_name, c.last_name, SUM(s.quantity) AS total_quantity FROM customers c
JOIN sales s ON c.customer_id = s.customer_id

-- Calculate the total quantity purchased by each customer.
GROUP BY c.customer_id, c.first_name, c.last_name

-- Select only those customers whose total quantity purchased is greater than this average.
-- Calculate the average total quantity purchased across all customers.
HAVING SUM(s.quantity) > (
    SELECT AVG(total_quantity)
    FROM (
        SELECT SUM(quantity) AS total_quantity
        FROM sales
        GROUP BY customer_id
    ) AS customer_quantity
);