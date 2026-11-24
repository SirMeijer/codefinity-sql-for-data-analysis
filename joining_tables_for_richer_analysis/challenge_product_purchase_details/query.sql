-- Write your code here
SELECT c.first_name || ' ' || c.last_name AS customer_name, p.product_name, s.quantity
FROM customers c
JOIN sales s ON c.customer_id = s.customer_id
JOIN products p ON s.product_id = p.product_id;