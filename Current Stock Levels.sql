SELECT 
    product_id,
    product_name,
    category,
    stock_quantity
FROM products
WHERE stock_quantity < 25
ORDER BY stock_quantity ASC;
