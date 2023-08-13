-- Select, From, and Where Statement
SELECT restaurant_name, opening_time
FROM restaurant
WHERE opening_time >= "09:30:00";

-- Arithmetic Expressions
SELECT item_name, TRUNCATE(price*1.15, 2) AS nett_price
FROM menu_item;

-- Using Functions
SELECT COUNT(*) as count FROM `order` WHERE payment_method = "TUNAI";
SELECT MIN(total_price) AS minimum_total_price, MAX(total_price) AS maximum_total_price FROM `order`;

-- Wildcards
SELECT *
FROM menu_item
WHERE item_name like "%Ayam%";
SELECT *
FROM driver
WHERE driver_name like "Heru _______";

-- Using Comparison Operators
SELECT *
FROM order_item
WHERE quantity != 1;

-- Null Values
SELECT *
FROM customer
WHERE customer_name IS NOT NULL;

-- Boolean Operators
SELECT *
FROM `order`
WHERE payment_method = "E-MONEY" AND (total_price <= 50000 OR `status` = "SELESAI");

-- Range
SELECT *
FROM menu_item
WHERE price BETWEEN 10000 AND 20000;

-- Distinct Values
SELECT DISTINCT category
FROM menu_item;

-- IN and NOT IN
SELECT *
FROM customer
WHERE customer_name NOT IN("Budi Tabudi","Setno Nugraha");

-- ORDER BY CLauses
SELECT *
FROM customer 
ORDER BY customer_name ASC;

-- GROUP BY Clauses
SELECT status, count(status) as count
FROM `order`
GROUP BY status;

-- HAVING Clauses
SELECT category, AVG(price) as average_price
FROM menu_item
GROUP BY category
HAVING average_price <= 20000;

-- Equi Join
SELECT customer.customer_name, `order`.order_date
FROM customer, `order`
WHERE customer.customer_id = `order`.customer_id;

-- Natural Join
SELECT driver.driver_name, menu_item.item_name
FROM driver
NATURAL JOIN `order`
NATURAL JOIN order_item
NATURAL JOIN menu_item
WHERE menu_item.item_name = "Mie Goreng Ayam";