-- create_tables.sql
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    stock_quantity INT,
    unit_price DECIMAL(10, 2)
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    sale_date DATE,
    quantity_sold INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO products (product_id, product_name, category, stock_quantity, unit_price) VALUES
(1, 'Galaxy S23', 'Smartphones', 50, 250000.00),
(2, 'MacBook Pro 14', 'Laptops', 20, 1200000.00),
(3, 'AirPods Pro', 'Headphones', 100, 80000.00),
(4, 'Galaxy Watch 5', 'Smartwatches', 30, 150000.00),
(5, 'iPhone 14', 'Smartphones', 10, 300000.00);

INSERT INTO sales (sale_id, product_id, sale_date, quantity_sold) VALUES
(1, 1, '2025-04-01', 5),
(2, 3, '2025-04-05', 20),
(3, 4, '2025-04-10', 8),
(4, 1, '2025-04-15', 10),
(5, 2, '2025-05-01', 2),
(6, 3, '2025-05-03', 15),
(7, 4, '2025-05-10', 5);
