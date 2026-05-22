-- =========================================================
-- E-COMMERCE SALES & PROFIT ANALYSIS PROJECT
-- SQL ANALYSIS QUERIES
-- Tools Used: MySQL, Power BI
-- =========================================================


-- =========================================================
-- DATABASE CREATION
-- =========================================================

CREATE DATABASE ecommerce_project;

USE ecommerce_project;


-- =========================================================
-- BASIC DATA EXPLORATION
-- =========================================================

-- View Row ID
SELECT `Row ID`
FROM orders;

-- Describe table structure
DESCRIBE orders;

-- Total number of records
SELECT COUNT(*) AS total_records
FROM orders;

-- View complete dataset
SELECT *
FROM orders;

-- Check NULL values in Sales
SELECT sales
FROM orders
WHERE sales IS NULL;

-- Count negative profit records
SELECT COUNT(*) AS negative_profit_orders
FROM orders
WHERE profit < 0;


-- =========================================================
-- KPI ANALYSIS
-- =========================================================

-- Total Sales
SELECT ROUND(SUM(sales)) AS total_sales
FROM orders;

-- Total Profit
SELECT SUM(profit) AS total_profit
FROM orders;

-- Total Orders
SELECT COUNT(`Row ID`) AS total_orders
FROM orders;

-- Average Sales
SELECT AVG(sales) AS average_sales
FROM orders;

-- Highest Sales
SELECT MAX(sales) AS highest_sales
FROM orders;

-- Profit Margin
SELECT 
    SUM(profit) / SUM(sales) * 100 AS profit_margin
FROM orders;


-- =========================================================
-- CATEGORY ANALYSIS
-- =========================================================

-- Category-wise Sales
SELECT 
    category,
    ROUND(SUM(sales), 2) AS total_sales
FROM orders
GROUP BY category;

-- Category-wise Profit
SELECT 
    category,
    ROUND(SUM(profit), 1) AS total_profit
FROM orders
GROUP BY category;

-- Category Profitability Comparison
SELECT 
    category,
    ROUND(SUM(profit), 1) AS total_profit
FROM orders
GROUP BY category
ORDER BY total_profit DESC;

-- Average Discount by Category
SELECT 
    category,
    ROUND(AVG(discount), 2) AS avg_discount
FROM orders
GROUP BY category;

-- Average Profit by Category
SELECT 
    category,
    ROUND(AVG(profit), 2) AS avg_profit
FROM orders
GROUP BY category;


-- =========================================================
-- REGIONAL ANALYSIS
-- =========================================================

-- Best Performing Region by Sales
SELECT 
    region,
    ROUND(SUM(sales), 1) AS best_performance
FROM orders
GROUP BY region
ORDER BY best_performance DESC
LIMIT 1;

-- Region with Lowest Profit
SELECT 
    region,
    ROUND(SUM(profit), 1) AS low_profit
FROM orders
GROUP BY region
ORDER BY low_profit ASC
LIMIT 1;


-- =========================================================
-- PRODUCT ANALYSIS
-- =========================================================

-- Highest Selling Product
SELECT 
    `Product Name`,
    ROUND(SUM(sales), 1) AS highest_sales
FROM orders
GROUP BY `Product Name`
ORDER BY highest_sales DESC
LIMIT 1;

-- Loss-Making Products
SELECT 
    `Product Name`,
    ROUND(SUM(profit), 1) AS total_loss
FROM orders
GROUP BY `Product Name`
ORDER BY total_loss ASC
LIMIT 1;


-- =========================================================
-- CUSTOMER ANALYSIS
-- =========================================================

-- Top Customers by Sales
SELECT 
    `Customer Name`,
    ROUND(SUM(sales), 1) AS total_sales
FROM orders
GROUP BY `Customer Name`
ORDER BY total_sales DESC
LIMIT 5;

-- Top Customers by Profitability
SELECT 
    `Customer Name`,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM orders
GROUP BY `Customer Name`
ORDER BY total_profit DESC
LIMIT 5;


-- =========================================================
-- DISCOUNT ANALYSIS
-- =========================================================

-- Discount Impact on Profitability
SELECT 
    category,
    ROUND(AVG(discount), 2) AS avg_discount,
    ROUND(AVG(profit), 2) AS avg_profit
FROM orders
GROUP BY category;


-- =========================================================
-- TIME INTELLIGENCE ANALYSIS
-- =========================================================

-- Monthly Sales Trend
SELECT 
    MONTH(`Order Date`) AS month,
    ROUND(SUM(sales), 2) AS monthly_sales
FROM orders
GROUP BY MONTH(`Order Date`)
ORDER BY month;


-- =========================================================
-- FURNITURE CATEGORY DEEP-DIVE ANALYSIS
-- =========================================================

-- Worst Furniture Products by Profit
SELECT 
    `Product Name`,
    ROUND(SUM(profit), 2) AS total_profit
FROM orders
WHERE category = 'Furniture'
GROUP BY `Product Name`
ORDER BY total_profit ASC;

-- Furniture Profitability by Region
SELECT 
    region,
    ROUND(SUM(profit), 2) AS total_profit
FROM orders
WHERE category = 'Furniture'
GROUP BY region
ORDER BY total_profit DESC;

-- Furniture Discount Pattern Analysis
SELECT 
    region,
    ROUND(AVG(discount), 2) AS avg_discount,
    ROUND(AVG(profit), 2) AS avg_profit
FROM orders
WHERE category = 'Furniture'
GROUP BY region
ORDER BY avg_discount DESC;


-- =========================================================
-- END OF PROJECT
-- =========================================================
