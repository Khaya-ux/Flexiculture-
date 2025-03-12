-- Inserting dummy products
INSERT INTO products (name, description, price, image_url, category, in_stock, material) VALUES 
('Classic Flexi T-Shirt', 'A comfortable cotton T-shirt with the Flexiculture logo.', 349.99, '/assets/WhatsApp Image 2025-02-24 at 20.25.01 (1).jpeg', 'T-Shirts', true, 'Cotton'),
('Premium Flexi Hoodie', 'Coming Soon', 499.99, '/assets/WhatsApp Image 2025-02-24 at 20.25.01 (2).jpeg', 'Hoodies', true, 'Cotton Blend'),
('5-Panel Flexi Cap', 'Coming Soon', 119.99, '/assets/WhatsApp Image 2025-02-24 at 20.25.02.jpeg', 'Accessories', true, 'Cotton'),
('Flexi Beanie', 'Coming Soon', 99.99, '/assets/WhatsApp Image 2025-02-24 at 20.25.01.jpeg', 'T-Shirts', true, 'Cotton'),
('Premium Flexi Tote', 'Coming soon', 149.99, '/assets/WhatsApp Image 2025-02-24 at 20.25.01 (2).jpeg', 'Hoodies', true, 'Polyester'),


-- Adding product sizes to the ElementCollection table (the default table name is product_sizes)
INSERT INTO product_sizes (product_id, sizes) VALUES 
(1, 'S'), (1, 'M'), (1, 'L'), (1, 'XL'),
(2, 'S'), (2, 'M'), (2, 'L'), (2, 'XL'), (2, 'XXL'),
(3, 'S'), (3, 'M'), (3, 'L'), (3, 'XL'),
(4, 'S'), (5, 'M'), (5, 'L'), (5, 'XL'),
(5, 'S'), (6, 'M'), (6, 'L'), (6, 'XL'), (6, 'XXL'),


-- Adding product colors to the ElementCollection table (the default table name is product_colors)
INSERT INTO product_colors (product_id, colors) VALUES 
(1, 'Black'), (1, 'White'), (1, 'Blue'),
(2, 'Black'), (2, 'Gray'), (2, 'Navy'),
(3, 'Black'), (3, 'Gray'),
(4, 'Black'), (4, 'White'), (4, 'Red'),
(5, 'Black'), (5, 'White'), (5, 'Green'),



-- Inserting dummy orders with embedded shipping address
INSERT INTO orders (customer_name, customer_email, street, city, state, zip_code, country, total_price, payment_status, payment_reference, order_date, payment_date) VALUES 
('John Doe', 'john.doe@example.com', '123 Main St', 'Lagos', 'Lagos State', '100001', 'Nigeria', 12999.99, 'PAID', 'FLEXI-1614245523-1', '2025-02-25 10:15:23', '2025-02-25 10:17:45'),
('Jane Smith', 'jane.smith@example.com', '456 Park Avenue', 'Abuja', 'FCT', '900108', 'Nigeria', 20999.98, 'PAID', 'FLEXI-1616418720-2', '2025-03-01 14:32:00', '2025-03-01 14:35:12'),
('Michael Johnson', 'michael@example.com', '789 Broadway', 'Port Harcourt', 'Rivers State', '500272', 'Nigeria', 3999.99, 'PENDING', 'FLEXI-1617628500-3', '2025-03-05 09:45:00', NULL),
('Sarah Williams', 'sarah@example.com', '321 Oak Street', 'Kano', 'Kano State', '700001', 'Nigeria', 27999.97, 'SHIPPED', 'FLEXI-1618152300-4', '2025-03-08 16:25:00', '2025-03-08 16:27:30');

-- Inserting dummy order items (connecting orders with products)
-- For Order 1
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) VALUES 
(1, 2, 1, 12999.99, 12999.99);

-- For Order 2
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) VALUES 
(2, 1, 2, 5999.99, 11999.98),
(2, 4, 1, 3999.99, 3999.99),
(2, 8, 1, 4999.99, 4999.99);

-- For Order 3
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) VALUES 
(3, 4, 1, 3999.99, 3999.99);

-- For Order 4
INSERT INTO order_items (order_id, product_id, quantity, unit_price, subtotal) VALUES 
(4, 6, 1, 15999.99, 15999.99),
(4, 5, 1, 6999.99, 6999.99),
(4, 8, 1, 4999.99, 4999.99);