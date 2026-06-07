
-- Drop table if it already exists
DROP TABLE IF EXISTS superstore;

-- Create new table on the basis of the csv file loaded
CREATE TABLE superstore (
    row_id INTEGER,
    order_id VARCHAR(20),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(20),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(20),
    region VARCHAR(20),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),
    sales NUMERIC(10,2),
    quantity INTEGER,
    discount NUMERIC(4,2),
    profit NUMERIC(10,2),
    year INTEGER,
    month INTEGER,
    month_year VARCHAR(20)
);

SELECT COUNT(*) FROM superstore;

Select * from superstore;

-- =============================================
-- RetailPulse - SQL Analysis
-- =============================================

-- Query 1: Monthly Sales Trend
SELECT
    month_year,
    ROUND(SUM(sales)::numeric, 2) AS total_sales
FROM superstore
GROUP BY month_year
ORDER BY month_year;

-- Query 2: Category-wise Revenue and Profit
SELECT
    category,
    ROUND(SUM(sales)::numeric, 2) AS total_sales,
    ROUND(SUM(profit)::numeric, 2) AS total_profit
FROM superstore
GROUP BY category
ORDER BY total_sales DESC;

-- Query 3: Top 5 Sub-categories by Sales
SELECT
    sub_category,
    ROUND(SUM(sales)::numeric, 2) AS total_sales
FROM superstore
GROUP BY sub_category
ORDER BY total_sales DESC
LIMIT 5;

-- Query 4: Region-wise Performance
SELECT
    region,
    ROUND(SUM(sales)::numeric, 2) AS total_sales,
    ROUND(SUM(profit)::numeric, 2) AS total_profit,
    ROUND(AVG(profit)::numeric, 2) AS avg_profit
FROM superstore
GROUP BY region
ORDER BY total_sales DESC;

-- Query 5: Year-over-Year Sales Growth
SELECT
    year,
    ROUND(SUM(sales)::numeric, 2) AS total_sales
FROM superstore
GROUP BY year
ORDER BY year;

-- Query 6: Worst Performing Sub-categories
SELECT
    sub_category,
    ROUND(SUM(profit)::numeric, 2) AS total_profit
FROM superstore
GROUP BY sub_category
ORDER BY total_profit ASC
LIMIT 5;