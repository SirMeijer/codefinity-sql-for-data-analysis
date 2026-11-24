-- Write your code here
SELECT * FROM products p
WHERE p.product_id NOT IN (
    SELECT s.product_id FROM sales s);