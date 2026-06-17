
use business;
drop table if exists Customers,Products , Sales;

-- Customers Table
CREATE TABLE Customers
(
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

-- Products Table
CREATE TABLE Products
(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    cost_price DECIMAL(10,2),
    selling_price DECIMAL(10,2)
);

-- Sales Table
CREATE TABLE Sales
(
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    sale_date DATE
);

-- Insert Customers
INSERT INTO Customers VALUES
(1,'Amit Sharma','Mumbai'),
(2,'Priya Verma','Pune'),
(3,'Rahul Patil','Nagpur'),
(4,'Sneha Gupta','Delhi'),
(5,'Karan Singh','Hyderabad');

-- Insert Products
INSERT INTO Products VALUES
(101,'Laptop','Electronics',40000,55000),
(102,'Mobile','Electronics',15000,22000),
(103,'Headphones','Accessories',800,1500),
(104,'Keyboard','Accessories',700,1200),
(105,'Monitor','Electronics',8000,12000);

-- Insert Sales
INSERT INTO Sales VALUES
(1,1,101,2,'2025-01-10'),
(2,2,102,3,'2025-01-15'),
(3,3,103,5,'2025-02-01'),
(4,1,105,1,'2025-02-10'),
(5,4,101,1,'2025-03-05'),
(6,5,104,4,'2025-03-12'),
(7,2,103,3,'2025-04-08'),
(8,3,102,2,'2025-04-15'),
(9,4,105,2,'2025-05-01'),
(10,5,101,1,'2025-05-10');

SELECT * FROM Customers;

SELECT * FROM Products;

/*=========================================================
    QUERY 3: DISPLAY COMPLETE SALES DETAILS
=========================================================*/

SELECT sale_id,customer_name,product_name,quantity,sale_date FROM Sales s
JOIN Customers c ON s.customer_id = c.customer_id
JOIN Products p ON s.product_id = p.product_id;

/*=========================================================
    QUERY 4: TOTAL REVENUE
    Revenue = Selling Price × Quantity
=========================================================*/

SELECT SUM(p.selling_price * s.quantity) AS Total_Revenue
FROM Products p
JOIN Sales s ON p.product_id = s.product_id;

/*=========================================================
    QUERY 5: TOTAL COST
    Cost = Cost Price × Quantity
=========================================================*/

SELECT SUM(p.cost_price * s.quantity) AS Total_Cost
FROM Products p
JOIN Sales s ON p.product_id = s.product_id;

/*=========================================================
    QUERY 6: TOTAL PROFIT
    Profit = Revenue - Cost
=========================================================*/

SELECT SUM((p.selling_price - p.cost_price) * s.quantity) AS Total_Profit
FROM Products p
JOIN Sales s ON p.product_id = s.product_id;

/*=========================================================
    QUERY 7: TOP SELLING PRODUCTS
=========================================================*/

SELECT p.product_name,SUM(s.quantity) AS Total_Quantity_Sold
FROM Products p
JOIN Sales s ON p.product_id = s.product_id
GROUP BY p.product_name
ORDER BY Total_Quantity_Sold DESC;

/*=========================================================
    QUERY 8: PRODUCT-WISE PROFIT
=========================================================*/

SELECT p.product_name,SUM((p.selling_price - p.cost_price) * s.quantity)AS Profit
FROM Products p
JOIN Sales s ON p.product_id = s.product_id
GROUP BY p.product_name
ORDER BY Profit DESC;

/*=========================================================
    QUERY 9: TOP CUSTOMERS BY REVENUE
=========================================================*/

SELECT c.customer_name, SUM(p.selling_price * s.quantity) AS Revenue
FROM Customers c
JOIN Sales s ON c.customer_id = s.customer_id
JOIN Products p ON s.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY Revenue DESC;

/*=========================================================
    QUERY 10: CATEGORY-WISE REVENUE
=========================================================*/

SELECT p.category,SUM(p.selling_price * s.quantity) AS Revenue
FROM Products p
JOIN Sales s ON p.product_id = s.product_id
GROUP BY p.category;

/*=========================================================
    PROJECT COMPLETED

    INSIGHTS:
    1. Total Revenue Generated
    2. Total Cost Incurred
    3. Total Profit Earned
    4. Top Selling Products
    5. Most Profitable Products
    6. Top Customers
    7. Category Performance
    8. Sales Performance Analysis

    Concept Used
    ✔ SQL
    ✔ Database Design
    ✔ JOIN
    ✔ GROUP BY
    ✔ ORDER BY
    ✔ Aggregate Functions
    
=========================================================*/ 