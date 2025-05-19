-- queries.sql
-- Current Stock Levels
SELECT 
    product_id,
    product_name,
    category,
    stock_quantity
FROM products
WHERE stock_quantity < 25
ORDER BY stock_quantity ASC;

-- Slow-Moving Products
SELECT 
    p.product_id,
    p.product_name,
    p.category,
    p.stock_quantity,
    COALESCE(SUM(s.quantity_sold), 0) as total_sold,
    ROUND(COALESCE(SUM(s.quantity_sold), 0) / p.stock_quantity * 100, 2) as sell_through_rate
FROM products p
LEFT JOIN sales s ON p.product_id = s.product_id
GROUP BY p.product_id, p.product_name, p.category, p.stock_quantity
HAVING sell_through_rate < 20
ORDER BY sell_through_rate ASC;

-- Top-Selling Categories
SELECT 
    p.category,
    SUM(s.quantity_sold) as total_units_sold,
    SUM(s.quantity_sold * p.unit_price) as total_revenue
FROM products p
JOIN sales s ON p.product_id = s.product_id
GROUP BY p.category
ORDER BY total_units_sold DESC;

-- Sales Trends Over Time
SELECT 
    DATE_FORMAT(s.sale_date, '%Y-%m') as sale_month,
    SUM(s.quantity_sold) as total_units_sold,
    SUM(s.quantity_sold * p.unit_price) as total_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY sale_month
ORDER BY sale_month;
