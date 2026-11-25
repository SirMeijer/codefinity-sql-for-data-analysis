-- Write your code here

-- Calculate the total quantity purchased for each customer.
-- Rank customers based on their total quantity purchased, with the highest quantity receiving rank 1.
SELECT c.customer_id, c.first_name, c.last_name, SUM(s.quantity) AS total_quantity,
    RANK() OVER (ORDER BY SUM(s.quantity) DESC) AS customer_rank
    FROM customers c
JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name

-- Select only the top 3 customers according to this ranking.
ORDER BY customer_rank
LIMIT 3