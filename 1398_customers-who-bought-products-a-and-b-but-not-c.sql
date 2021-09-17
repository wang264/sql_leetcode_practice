-- 1398. Customers Who Bought Products A and B but Not C
-- Medium

-- Table: Customers

-- +---------------------+---------+
-- | Column Name         | Type    |
-- +---------------------+---------+
-- | customer_id         | int     |
-- | customer_name       | varchar |
-- +---------------------+---------+
-- customer_id is the primary key for this table.
-- customer_name is the name of the customer.
--  

-- Table: Orders

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | order_id      | int     |
-- | customer_id   | int     |
-- | product_name  | varchar |
-- +---------------+---------+
-- order_id is the primary key for this table.
-- customer_id is the id of the customer who bought the product "product_name".
--  

-- Write an SQL query to report the customer_id and customer_name of customers who bought products "A", "B" but did not buy the product "C" since we want to recommend them buy this product.

-- Return the result table ordered by customer_id.

-- The query result format is in the following example.

--  

-- Customers table:
-- +-------------+---------------+
-- | customer_id | customer_name |
-- +-------------+---------------+
-- | 1           | Daniel        |
-- | 2           | Diana         |
-- | 3           | Elizabeth     |
-- | 4           | Jhon          |
-- +-------------+---------------+

-- Orders table:
-- +------------+--------------+---------------+
-- | order_id   | customer_id  | product_name  |
-- +------------+--------------+---------------+
-- | 10         |     1        |     A         |
-- | 20         |     1        |     B         |
-- | 30         |     1        |     D         |
-- | 40         |     1        |     C         |
-- | 50         |     2        |     A         |
-- | 60         |     3        |     A         |
-- | 70         |     3        |     B         |
-- | 80         |     3        |     D         |
-- | 90         |     4        |     C         |
-- +------------+--------------+---------------+

-- Result table:
-- +-------------+---------------+
-- | customer_id | customer_name |
-- +-------------+---------------+
-- | 3           | Elizabeth     |
-- +-------------+---------------+
-- Only the customer_id with id 3 bought the product A and B but not the product C.


-- Create table If Not Exists Customers (customer_id int, customer_name varchar(30));
-- Create table If Not Exists Orders (order_id int, customer_id int, product_name varchar(30));
-- Truncate table Customers;
-- insert into Customers (customer_id, customer_name) values ('1', 'Daniel');
-- insert into Customers (customer_id, customer_name) values ('2', 'Diana');
-- insert into Customers (customer_id, customer_name) values ('3', 'Elizabeth');
-- insert into Customers (customer_id, customer_name) values ('4', 'Jhon');
-- Truncate table Orders;
-- insert into Orders (order_id, customer_id, product_name) values ('10', '1', 'A');
-- insert into Orders (order_id, customer_id, product_name) values ('20', '1', 'B');
-- insert into Orders (order_id, customer_id, product_name) values ('30', '1', 'D');
-- insert into Orders (order_id, customer_id, product_name) values ('40', '1', 'C');
-- insert into Orders (order_id, customer_id, product_name) values ('50', '2', 'A');
-- insert into Orders (order_id, customer_id, product_name) values ('60', '3', 'A');
-- insert into Orders (order_id, customer_id, product_name) values ('70', '3', 'B');
-- insert into Orders (order_id, customer_id, product_name) values ('80', '3', 'D');
-- insert into Orders (order_id, customer_id, product_name) values ('90', '4', 'C');


Select c.customer_id, c.customer_name
From Orders o Left Join Customers c On o.customer_id = c.customer_id
Group By o.customer_id, c.customer_name
Having
	(
    Sum( Case When o.product_name = 'A' Then 1 Else 0 End) >=1
    And 
    Sum( Case When o.product_name = 'B' Then 1 Else 0 End) >=1
    And
    Sum( Case When o.product_name = 'C' Then 1 Else 0 End) =0
    );



