-- view your data
SELECT * FROM sales;
-- Basic Filtering (WHERE)
SELECT customername, country, sales
FROM sales WHERE country = 'USA';
-- Sorting (ORDER BY)
SELECT customername, sales
FROM sales ORDER BY sales DESC;
-- Aggregation (GROUP BY)
SELECT country, SUM(sales) AS total_sales
FROM sales GROUP BY country;
-- HAVING (Filtering Aggregates)
SELECT country, SUM(sales) AS total_sales
FROM sales GROUP BY country HAVING total_sales > 10000;

-- Top Products
SELECT productline, SUM(sales) AS total_sales
FROM sales GROUP BY productline ORDER BY total_sales DESC;

-- Top Customers
SELECT customername, SUM(sales) AS total_spent
FROM sales GROUP BY customername ORDER BY total_spent DESC LIMIT 10;

-- Revenue Trend Over Time
SELECT year_id, month_id, SUM(sales) AS revenue
FROM sales GROUP BY year_id, month_id ORDER BY year_id, month_id;

-- Customer Behaviour
SELECT dealsize, COUNT(*) AS total_orders
FROM sales GROUP BY dealsize;

-- Subquery (Advanced)
SELECT customername, sales FROM sales WHERE sales > (SELECT AVG(sales) FROM sales);

-- Window Function (Advanced)
SELECT customername, sales,RANK() OVER (ORDER BY sales DESC) AS rank_position FROM sales;

-- Final Check
SELECT COUNT(*) FROM sales;



