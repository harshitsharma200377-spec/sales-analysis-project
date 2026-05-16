CREATE DATABASE IF NOT EXISTS superstore;
USE superstore;

-- Superstore Sales Analytics - MySQL workflow
-- Dataset: data/Superstore Sales Dataset.csv
-- Recommended table name: sales

-- Optional schema if you want to create the table before importing the CSV.
-- If you use MySQL Workbench Table Data Import Wizard, map the CSV columns to these fields.
CREATE TABLE IF NOT EXISTS sales (
    `Row ID` INT,
    `Order ID` VARCHAR(30),
    `Order Date` VARCHAR(20),
    `Ship Date` VARCHAR(20),
    `Ship Mode` VARCHAR(50),
    `Customer ID` VARCHAR(30),
    `Customer Name` VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(80),
    City VARCHAR(80),
    State VARCHAR(80),
    `Postal Code` VARCHAR(20),
    Region VARCHAR(50),
    `Product ID` VARCHAR(40),
    Category VARCHAR(50),
    `Sub-Category` VARCHAR(50),
    `Product Name` VARCHAR(255),
    Sales DECIMAL(12, 3)
);

-- Import option:
-- 1. Open MySQL Workbench.
-- 2. Right-click the superstore schema and choose Table Data Import Wizard.
-- 3. Select data/Superstore Sales Dataset.csv.
-- 4. Import into the sales table.

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

-- Sales by region
SELECT
    Region,
    ROUND(SUM(Sales), 2) AS total_sales
FROM sales
GROUP BY Region
ORDER BY total_sales DESC;

-- Sales by customer segment
SELECT
    Segment,
    ROUND(SUM(Sales), 2) AS total_sales
FROM sales
GROUP BY Segment
ORDER BY total_sales DESC;
