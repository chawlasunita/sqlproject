create database online_retail_store;
use online_retail_store;

 CREATE TABLE customers (
    customer_id int not null auto_increment primary key,
    first_name VARCHAR(255) not null,
    last_name VARCHAR(255) default null,
    email VARCHAR(255)
);

CREATE TABLE orders (
    order_id int primary key,
    customer_id int(255) not null,
    order_date date not null,
    total_amount int(255),
    foreign key orders(customer_id)references customers(customer_id));
   

   
    
    
    
    
   create table products(product_id int(50)not null primary key,
   product_name varchar(255)not null,
   category_id int(255)not null,
   price DECIMAL(10, 2) not null,
   foreign key products(category_id)references customers(customer_id)
   
);

 
  
  create table Categores(category_id varchar(50)not null primary key,
  category_name varchar(255)not null);
  
  
 -- Basic Queries:
 SELECT first_name, last_name, email FROM Customers;
 SELECT customer_id, COUNT(order_id) AS total_orders FROM Orders GROUP BY customer_id;
 SELECT product_name, price FROM Products;
 SELECT category_id, COUNT(product_id) AS product_count FROM Products GROUP BY category_id ORDER BY product_count DESC LIMIT 1;

-- Intermediate Queries:
 SELECT first_name, last_name FROM Customers LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id WHERE Orders.customer_id IS NULL;
 SELECT product_name, price FROM Products ORDER BY price DESC LIMIT 1 UNION SELECT product_name, price FROM Products ORDER BY price LIMIT 1;
 SELECT customer_id, AVG(total_amount) AS avg_order_amount FROM Orders GROUP BY customer_id;
 SELECT category_id, category_name FROM Categories LEFT JOIN Products ON Categories.category_id = Products.category_id WHERE Products.product_id IS NULL;

-- Advanced Queries:
 SELECT DISTINCT Customers.first_name, Customers.last_name FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id JOIN Products ON Orders.total_amount > 100 AND Orders.product_id = Products.product_id;
 SELECT Customers.first_name, Customers.last_name FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id JOIN Products ON Orders.product_id = Products.product_id GROUP BY Customers.customer_id HAVING COUNT(DISTINCT Products.category_id) >= 3;
 -- Assuming there's a Ratings table with product_id and rating columns --
SELECT product_id, AVG(rating) AS avg_rating FROM Ratings GROUP BY product_id ORDER BY avg_rating DESC LIMIT 1 UNION SELECT product_id, AVG(rating) AS avg_rating FROM Ratings GROUP BY product_id ORDER BY avg_rating LIMIT 1;
 SELECT Categories.category_name, SUM(Products.price) AS total_revenue FROM Categories LEFT JOIN Products ON Categories.category_id = Products.category_id GROUP BY Categories.category_id;

-- Complex Queries:
 SELECT DISTINCT Customers.first_name, Customers.last_name FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id WHERE Orders.order_date >= NOW() - INTERVAL 30 DAY;
 SELECT product_name FROM Products LEFT JOIN Orders ON Products.product_id = Orders.product_id WHERE Orders.order_date IS NULL OR Orders.order_date <= NOW() - INTERVAL 7 DAY;
 SELECT product_name 
FROM Products 
ORDER BY (MAX(price) - MIN(price)) DESC 
LIMIT 1

UNION

SELECT product_name 
FROM Products 
ORDER BY (MAX(price) - MIN(price)) 
LIMIT 1;

 SELECT product_name FROM Products ORDER BY (MAX(price) - MIN(price)) DESC LIMIT 1 UNION SELECT product_name FROM Products ORDER BY (MAX(price) - MIN(price)) LIMIT 1;
 SELECT Categories.category_name, COUNT(Products.product_id) AS total_products, SUM(Products.price) AS total_revenue FROM Categories LEFT JOIN Products ON Categories.category_id = Products.category_id GROUP BY Categories.category_id;

-- Expert-Level Queries:
 
    
  
                       
    