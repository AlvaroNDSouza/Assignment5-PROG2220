SELECT '' AS 'Alvaro, de Souza';
SELECT '' AS 'Student Number : 8880494';
SELECT '' AS 'PROG2220: Section #6';
SELECT '' AS 'Assignment #5:';
SELECT SYSDATE() AS 'Current System Date';

USE my_guitar_shop;


SELECT '' AS '*** Task 1, Q1. ***';

-- Task 1, Q1
SELECT 
    FORMAT(list_price, 2) AS formatted_list_price,
    CAST(discount_percent AS SIGNED) AS integer_discount_percent,
    ROUND(list_price * (discount_percent / 100), 2) AS discount_amount,
    DATE_FORMAT(date_added, '%m-%d') AS month_day_added
FROM products;

SELECT '' AS '*** Task 1, Q2. ***';

-- Task 1, Q2
SELECT 
    order_date,
    DATE_FORMAT(order_date, '%Y') AS year,
    DATE_FORMAT(order_date, '%b-%d-%Y') AS formatted_date,
    DATE_FORMAT(order_date, '%r') AS time_12_hour,
    DATE_FORMAT(order_date, '%m/%d/%y %H:%i') AS date_time_format
FROM orders;



SELECT '' AS '*** Task 1, Q3. ***';

-- Task 1, Q3
SELECT 
    card_number,
    LENGTH(card_number) AS card_number_length,
    RIGHT(card_number, 4) AS last_four_digits,
    CONCAT('XXXX-XXXX-XXXX-', RIGHT(card_number, 4)) AS masked_card_number
FROM orders;


SELECT '' AS '*** Task 1, Q4. ***';

-- Task 1, Q4
SELECT 
    order_id,
    order_date,
    DATE_ADD(order_date, INTERVAL 2 DAY) AS est_ship_date,
    COALESCE(ship_date, 'Not Shipped') AS ship_date,
    DATEDIFF(ship_date, order_date) AS days_to_ship
FROM orders
WHERE YEAR(order_date) = 2015 AND MONTH(order_date) = 4;

SELECT '' AS '*** Task 1, Q5. ***';

-- Task 1, Q5

CREATE VIEW XX_order_item_products AS
SELECT 
    o.order_id, 
    o.order_date, 
    oi.item_price, 
    oi.discount_amount, 
    oi.item_price - oi.discount_amount AS final_price,
    oi.quantity, 
    oi.item_price * oi.quantity AS item_total,
    p.product_name
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;

-- Display records

SELECT * FROM XX_order_item_products;

SELECT '' AS '*** Task 1, Q6. ***';

-- Task 1, Q6
SELECT 
    order_id, 
    product_name, 
    item_total 
FROM XX_order_item_products 
ORDER BY product_name ASC, order_id ASC;

SELECT '' AS '*** Task 1, Q7. ***';

-- Task 1, Q7
CREATE VIEW XX_product_summary AS
SELECT 
    product_name, 
    COUNT(*) AS order_count, 
    SUM(item_total) AS order_total 
FROM XX_order_item_products 
GROUP BY product_name;

SELECT '' AS '*** Task 1, Q8. ***';

-- Task 1, Q8
SELECT * 
FROM XX_product_summary 
ORDER BY order_total DESC 
LIMIT 5;

