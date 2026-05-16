CREATE DATABASE IF NOT EXISTS superstore;
USE superstore;

-- Import the CSV into a table named sales using MySQL Workbench Table Data Import Wizard.
-- Recommended table name: sales

-- Total rows
SELECT COUNT(*) AS total_rows
FROM sales;

-- Preview records
SELECT *
FROM sales
LIMIT 5;

-- Total sales
SELECT ROUND(SUM(Sales), 2) AS total_sales
FROM sales;

-- Sales by category
SELECT
    Category,
    ROUND(SUM(Sales), 2) AS total_sales
FROM sales
GROUP BY Category
ORDER BY total_sales DESC;

-- Top 5 cities by sales
SELECT
    City,
    ROUND(SUM(Sales), 2) AS total_sales
FROM sales
GROUP BY City
ORDER BY total_sales DESC
LIMIT 5;

-- Monthly sales
-- Use this query if Order Date was imported as text in dd/mm/yyyy format.
SELECT
    MONTH(STR_TO_DATE(`Order Date`, '%d/%m/%Y')) AS order_month,
    ROUND(SUM(Sales), 2) AS total_sales
FROM sales
GROUP BY order_month
ORDER BY order_month;
