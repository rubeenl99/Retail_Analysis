/*
Retail Sales Data Analysis

Skills used: Joins, CTEs, Aggregate Functions, GROUP BY, ORDER BY, Window Functions, CASE Statements, Creating Tables, Foreign Keys, Date Functions
*/

USE retail_data;

-- Create Customers Table: Stores customer demographics (ID, Gender, Age)
CREATE TABLE customers (
    CustomerID VARCHAR(20) PRIMARY KEY,
    Gender VARCHAR(10),
    Age INT
);

-- Create Sales Table: Stores all transactions and links to customers
CREATE TABLE sales (
    TransactionID INT PRIMARY KEY,
    Date DATETIME,
    CustomerID VARCHAR(20),
    ProductCategory VARCHAR(50),
    Quantity INT,
    PricePerUnit DECIMAL(10,2),
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID)
);

-- Total spent by customer
-- Calculates total amount spent per customer
SELECT 
    CustomerID,
    SUM(TotalAmount) AS TotalSpent
FROM sales
GROUP BY CustomerID
ORDER BY TotalSpent DESC;

-- Total sales by product category
-- Identifies top revenue-generating product categories
SELECT 
    ProductCategory,
    SUM(TotalAmount) AS TotalSales
FROM sales
GROUP BY ProductCategory
ORDER BY TotalSales DESC;

-- Sales by month
-- Shows monthly total sales to identify trends
SELECT 
    DATE_FORMAT(Date, '%Y-%m') AS Month,
    SUM(TotalAmount) AS TotalSales
FROM sales
GROUP BY Month
ORDER BY Month;

-- Sales by customer with demographic data
-- Combines sales and customer info to analyze spending by gender and age
SELECT 
    s.CustomerID,
    c.Gender,
    c.Age,
    SUM(s.TotalAmount) AS TotalSpent
FROM sales s
JOIN customers c ON s.CustomerID = c.CustomerID
GROUP BY s.CustomerID, c.Gender, c.Age
ORDER BY TotalSpent DESC;

-- Sales by age group and gender
-- Groups customers by age ranges and analyzes sales by gender
SELECT 
    c.Gender,
    CASE 
        WHEN c.Age < 25 THEN '18-24'
        WHEN c.Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN c.Age BETWEEN 35 AND 49 THEN '35-49'
        ELSE '50+' 
    END AS AgeGroup,
    SUM(s.TotalAmount) AS TotalSales
FROM sales s
JOIN customers c ON s.CustomerID = c.CustomerID
GROUP BY Gender, AgeGroup
ORDER BY TotalSales DESC;

-- Top 5 customers per product category
-- Identifies top spending customers within each product category
WITH ranked_customers AS (
    SELECT 
        ProductCategory,
        CustomerID,
        SUM(TotalAmount) AS TotalSpent,
        ROW_NUMBER() OVER (PARTITION BY ProductCategory ORDER BY SUM(TotalAmount) DESC) AS rn
    FROM sales
    GROUP BY ProductCategory, CustomerID
)
SELECT *
FROM ranked_customers
WHERE rn <= 5
ORDER BY ProductCategory, TotalSpent DESC;
