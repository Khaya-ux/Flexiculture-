-- Inserting dummy products
INSERT INTO products (name, description, price, image_url, category, in_stock, material) VALUES 
('Classic Flexi T-Shirt', 'A comfortable cotton T-shirt with the Flexiculture logo.', 5999.99, '/assets/WhatsApp Image 2025-02-24 at 20.25.01 (1).jpeg', 'T-Shirts', true, 'Cotton'),
('Premium Flexi Hoodie', 'Stay warm and stylish with our premium hoodie.', 12999.99, '/assets/WhatsApp Image 2025-02-24 at 20.25.01 (2).jpeg', 'Hoodies', true, 'Cotton Blend'),
('Flexi Sweatpants', 'Comfortable sweatpants perfect for lounging or working out.', 8999.99, '/assets/WhatsApp Image 2025-02-24 at 20.25.01.jpeg', 'Pants', true, 'Cotton Fleece'),
('Fitted Flexi Cap', 'A stylish fitted cap with the Flexiculture logo.', 3999.99, '/assets/WhatsApp Image 2025-02-24 at 20.25.02.jpeg', 'Accessories', true, 'Cotton'),
('Oversized Graphic Tee', 'An oversized T-shirt with unique Flexiculture graphic design.', 6999.99, '/assets/WhatsApp Image 2025-02-24 at 20.25.01.jpeg', 'T-Shirts', true, 'Cotton'),
('Zip-Up Flexi Jacket', 'A lightweight zip-up jacket for casual wear.', 15999.99, '/assets/WhatsApp Image 2025-02-24 at 20.25.01 (2).jpeg', 'Hoodies', true, 'Polyester'),
('Flexi Cargo Pants', 'Stylish cargo pants with multiple pockets.', 11999.99, '/assets/WhatsApp Image 2025-02-24 at 20.25.01.jpeg', 'Pants', true, 'Cotton Twill'),
('Flexi Tote Bag', 'A spacious tote bag with Flexiculture branding.', 4999.99, '/assets/WhatsApp Image 2025-02-24 at 20.25.02.jpeg', 'Accessories', true, 'Canvas'),
('Limited Edition T-Shirt', 'A limited edition design celebrating our brand.', 7999.99, '/assets/WhatsApp Image 2025-02-24 at 20.25.01 (1).jpeg', 'T-Shirts', true, 'Organic Cotton');

-- Adding product sizes to the ElementCollection table (the default table name is product_sizes)
INSERT INTO product_sizes (product_id, sizes) VALUES 
(1, 'S'), (1, 'M'), (1, 'L'), (1, 'XL'),
(2, 'S'), (2, 'M'), (2, 'L'), (2, 'XL'), (2, 'XXL'),
(3, 'S'), (3, 'M'), (3, 'L'), (3, 'XL'),
(5, 'S'), (5, 'M'), (5, 'L'), (5, 'XL'),
(6, 'S'), (6, 'M'), (6, 'L'), (6, 'XL'), (6, 'XXL'),
(7, 'S'), (7, 'M'), (7, 'L'), (7, 'XL'),
(9, 'S'), (9, 'M'), (9, 'L'), (9, 'XL');

-- Adding product colors to the ElementCollection table (the default table name is product_colors)
INSERT INTO product_colors (product_id, colors) VALUES 
(1, 'Black'), (1, 'White'), (1, 'Blue'),
(2, 'Black'), (2, 'Gray'), (2, 'Navy'),
(3, 'Black'), (3, 'Gray'),
(4, 'Black'), (4, 'White'), (4, 'Red'),
(5, 'Black'), (5, 'White'), (5, 'Green'),
(6, 'Black'), (6, 'Navy'), (6, 'Red'),
(7, 'Black'), (7, 'Khaki'), (7, 'Olive'),
(8, 'Black'), (8, 'Natural'),
(9, 'Black'), (9, 'White');

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