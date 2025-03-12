-- Inserting dummy products
INSERT INTO products (id, name, description, price, image_url, category, in_stock, material) VALUES 
(1, 'Classic Flexi T-Shirt', 'A comfortable cotton T-shirt with the Flexiculture logo.', 349.99, '/assets/WhatsApp Image 2025-02-24 at 20.25.01 (1).jpeg', 'T-Shirts', true, 'Cotton'),
(2, 'Premium Flexi Hoodie', 'Coming Soon', 499.99, '/assets/WhatsApp Image 2025-02-24 at 20.25.01 (2).jpeg', 'Hoodies', true, 'Cotton Blend'),
(3, '5-Panel Flexi Cap', 'Coming Soon', 119.99, '/assets/WhatsApp Image 2025-02-24 at 20.25.02.jpeg', 'Accessories', true, 'Cotton'),
(4, 'Flexi Beanie', 'Coming Soon', 99.99, '/assets/WhatsApp Image 2025-02-24 at 20.25.01.jpeg', 'Accessories', true, 'Cotton'),
(5, 'Premium Flexi Tote', 'Coming soon', 149.99, '/assets/WhatsApp Image 2025-02-24 at 20.25.01 (2).jpeg', 'Accessories', true, 'Polyester');

-- Adding product sizes to the ElementCollection table (the default table name is product_sizes)
INSERT INTO product_sizes (product_id, sizes) VALUES 
(1, 'S'), (1, 'M'), (1, 'L'), (1, 'XL'),
(2, 'S'), (2, 'M'), (2, 'L'), (2, 'XL'), (2, 'XXL'),
(3, 'S'), (3, 'M'), (3, 'L'), (3, 'XL'),
(4, 'S'), (4, 'M'), (4, 'L'), (4, 'XL'),
(5, 'S'), (5, 'M'), (5, 'L'), (5, 'XL'), (5, 'XXL');

-- Adding product colors to the ElementCollection table (the default table name is product_colors)
INSERT INTO product_colors (product_id, colors) VALUES 
(1, 'Black'), (1, 'White'), (1, 'Blue'),
(2, 'Black'), (2, 'Gray'), (2, 'Navy'),
(3, 'Black'), (3, 'Gray'),
(4, 'Black'), (4, 'White'), (4, 'Red'),
(5, 'Black'), (5, 'White'), (5, 'Green');
