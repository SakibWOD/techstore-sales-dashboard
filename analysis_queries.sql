--  Total Sales
SELECT SUM(total_sales) AS total_revenue
FROM sales;

--  Sales by Region
SELECT region, SUM(total_sales) AS revenue
FROM sales
GROUP BY region
ORDER BY revenue DESC;

--  Top Customer
SELECT c.customer_name, SUM(s.total_sales) AS revenue
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY revenue DESC;

-- Category Performance
SELECT category, SUM(total_sales) AS revenue
FROM sales
GROUP BY category;

-- Monthly Sales Trend
SELECT MONTH(order_date) AS month, SUM(total_sales) AS revenue
FROM sales
GROUP BY MONTH(order_date)
ORDER BY month;

--  Low Value Customers
SELECT c.customer_name, SUM(s.total_sales) AS revenue
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY revenue ASC;

--  High vs Low Sales (CASE WHEN)
SELECT product, total_sales,
CASE
    WHEN total_sales > 50000 THEN 'High Value'
    WHEN total_sales BETWEEN 10000 AND 50000 THEN 'Medium Value'
    ELSE 'Low Value'
END AS performance
FROM sales;