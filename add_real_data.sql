-- Insert 100 customers
INSERT INTO "Inventory"."Customers" ("First_Name", "Last_Name", "Email", "password") VALUES
('John', 'Doe', 'john.doe@example.com', 'password1'),
('Jane', 'Smith', 'jane.smith@example.com', 'password2'),
('Alice', 'Johnson', 'alice.johnson@example.com', 'password3'),
('Bob', 'Brown', 'bob.brown@example.com', 'password4'),
('Charlie', 'Davis', 'charlie.davis@example.com', 'password5');

-- Generate additional customers
DO $$
BEGIN
    FOR i IN 6..100 LOOP
        INSERT INTO "Inventory"."Customers" ("First_Name", "Last_Name", "Email", "password") 
        VALUES ('Test' || i, 'Test' || i, 'customer' || i || '@example.com', 'password' || i);
    END LOOP;
END $$;

-- Insert root categories
INSERT INTO "Inventory"."Category" (category_name, parent_category_id) VALUES
('Sports', NULL),
('Clothing', NULL),
('Electronics', NULL);

-- Insert sub-categories for Sports
INSERT INTO "Inventory"."Category" (category_name, parent_category_id) VALUES
('Running', (SELECT category_id FROM "Inventory"."Category" WHERE category_name = 'Sports')),
('Hiking', (SELECT category_id FROM "Inventory"."Category" WHERE category_name = 'Sports')),
('Cycling', (SELECT category_id FROM "Inventory"."Category" WHERE category_name = 'Sports'));

-- Insert sub-categories for Clothing
INSERT INTO "Inventory"."Category" (category_name, parent_category_id) VALUES
('Men', (SELECT category_id FROM "Inventory"."Category" WHERE category_name = 'Clothing')),
('Women', (SELECT category_id FROM "Inventory"."Category" WHERE category_name = 'Clothing')),
('Kids', (SELECT category_id FROM "Inventory"."Category" WHERE category_name = 'Clothing'));

-- Insert sub-categories for Electronics
INSERT INTO "Inventory"."Category" (category_name, parent_category_id) VALUES
('Mobile Phones', (SELECT category_id FROM "Inventory"."Category" WHERE category_name = 'Electronics')),
('Laptops', (SELECT category_id FROM "Inventory"."Category" WHERE category_name = 'Electronics')),
('Cameras', (SELECT category_id FROM "Inventory"."Category" WHERE category_name = 'Electronics'));

-- Insert products into Running
INSERT INTO "Inventory"."Product" (category_id, name, description, price, stock_quantity) VALUES
((SELECT category_id FROM "Inventory"."Category" WHERE category_name = 'Running'), 'Nike Running Shoes', 'Comfortable running shoes', 120.00, 50),
((SELECT category_id FROM "Inventory"."Category" WHERE category_name = 'Running'), 'Adidas Running Shoes', 'Durable running shoes', 110.00, 40);

-- Insert products into Hiking
INSERT INTO "Inventory"."Product" (category_id, name, description, price, stock_quantity) VALUES
((SELECT category_id FROM "Inventory"."Category" WHERE category_name = 'Hiking'), 'Timberland Hiking Boots', 'Durable hiking boots', 150.00, 30),
((SELECT category_id FROM "Inventory"."Category" WHERE category_name = 'Hiking'), 'Columbia Hiking Boots', 'Comfortable hiking boots', 140.00, 20);

-- Insert products into Cycling
INSERT INTO "Inventory"."Product" (category_id, name, description, price, stock_quantity) VALUES
((SELECT category_id FROM "Inventory"."Category" WHERE category_name = 'Cycling'), 'Giant Road Bike', 'Lightweight road bike', 900.00, 10),
((SELECT category_id FROM "Inventory"."Category" WHERE category_name = 'Cycling'), 'Trek Mountain Bike', 'Durable mountain bike', 850.00, 15);

-- Insert products into Men Clothing
INSERT INTO "Inventory"."Product" (category_id, name, description, price, stock_quantity) VALUES
((SELECT category_id FROM "Inventory"."Category" WHERE category_name = 'Men'), 'Levi\s Jeans', 'Comfortable jeans', 60.00, 100),
((SELECT category_id FROM "Inventory"."Category" WHERE category_name = 'Men'), 'Hanes T-Shirt', 'Soft cotton t-shirt', 15.00, 200);

-- Insert products into Women Clothing
INSERT INTO "Inventory"."Product" (category_id, name, description, price, stock_quantity) VALUES
((SELECT category_id FROM "Inventory"."Category" WHERE category_name = 'Women'), 'Nike Sports Bra', 'Supportive sports bra', 40.00, 150),
((SELECT category_id FROM "Inventory"."Category" WHERE category_name = 'Women'), 'Under Armour Leggings', 'Comfortable leggings', 50.00, 120);

-- Insert products into Kids Clothing
INSERT INTO "Inventory"."Product" (category_id, name, description, price, stock_quantity) VALUES
((SELECT category_id FROM "Inventory"."Category" WHERE category_name = 'Kids'), 'Gap Kids Jeans', 'Comfortable kids jeans', 30.00, 80),
((SELECT category_id FROM "Inventory"."Category" WHERE category_name = 'Kids'), 'Carter\s T-Shirt', 'Soft cotton t-shirt for kids', 10.00, 150);

-- Insert products into Mobile Phones
INSERT INTO "Inventory"."Product" (category_id, name, description, price, stock_quantity) VALUES
((SELECT category_id FROM "Inventory"."Category" WHERE category_name = 'Mobile Phones'), 'iPhone 13', 'Latest Apple smartphone', 999.00, 100),
((SELECT category_id FROM "Inventory"."Category" WHERE category_name = 'Mobile Phones'), 'Samsung Galaxy S21', 'Latest Samsung smartphone', 899.00, 90);

-- Insert products into Laptops
INSERT INTO "Inventory"."Product" (category_id, name, description, price, stock_quantity) VALUES
((SELECT category_id FROM "Inventory"."Category" WHERE category_name = 'Laptops'), 'MacBook Pro', 'Apple laptop with M1 chip', 1299.00, 50),
((SELECT category_id FROM "Inventory"."Category" WHERE category_name = 'Laptops'), 'Dell XPS 13', 'High-performance Dell laptop', 1199.00, 60);

-- Insert products into Cameras
INSERT INTO "Inventory"."Product" (category_id, name, description, price, stock_quantity) VALUES
((SELECT category_id FROM "Inventory"."Category" WHERE category_name = 'Cameras'), 'Canon EOS R5', 'High-resolution mirrorless camera', 3899.00, 20),
((SELECT category_id FROM "Inventory"."Category" WHERE category_name = 'Cameras'), 'Sony Alpha a7 III', 'Versatile full-frame mirrorless camera', 1999.00, 25);

-- Insert orders
INSERT INTO "Inventory"."Orders" ("OrderDate", "Total_amount", "CustomerID") VALUES
('2023-05-01', 240.00, (SELECT "CustomerID" FROM "Inventory"."Customers" where "Customers"."Last_Name" = 'Doe')),
('2023-05-02', 130.00, (SELECT "CustomerID" FROM "Inventory"."Customers" where "Customers"."Last_Name" = 'Smith')),
('2023-05-03', 999.00, (SELECT "CustomerID" FROM "Inventory"."Customers" where "Customers"."Last_Name" = 'Johnson')),
('2023-05-04', 250.00, (SELECT "CustomerID" FROM "Inventory"."Customers" where "Customers"."Last_Name" = 'Brown')),
('2023-05-05', 60.00, (SELECT "CustomerID" FROM "Inventory"."Customers" where "Customers"."Last_Name" = 'Davis'));

-- Generate additional orders
DO $$
BEGIN
    FOR i IN 6..500 LOOP
        INSERT INTO "Inventory"."Orders" ("OrderDate", "Total_amount", "CustomerID") 
        VALUES (NOW() - (RANDOM() * 365 || ' days')::INTERVAL, (RANDOM() * 500 + 50)::NUMERIC(6, 2), (RANDOM() * 99 + 1)::INTEGER);
    END LOOP;
END $$;

-- Insert order details
INSERT INTO "Inventory"."Order_Details" ("order_id", "product_id", "quantity", "unit_price") VALUES
(1, 19, 2, 120.00),
(2, 21, 1, 130.00),
(3, 29, 1, 999.00),
(4, 35, 1, 250.00),
(5, 32, 1, 60.00);

-- Generate additional order details
DO $$
BEGIN
    FOR i IN 1..2000 LOOP
        INSERT INTO "Inventory"."Order_Details" ("order_id", "product_id", "quantity", "unit_price") 
        VALUES ((RANDOM() * 499 + 1)::INTEGER, (RANDOM() * 19 + 1)::INTEGER, (RANDOM() * 10 + 1)::INTEGER, (RANDOM() * 100 + 10)::NUMERIC(6, 2));
    END LOOP;
END $$;

---------------------------------------------------------------------------
-- INSERT INTO "Inventory"."Category" (category_name, parent_category_id) VALUES
-- ('Shoes', NULL),
-- ('Boots',(SELECT category_id FROM "Inventory"."Category" WHERE category_name = 'Hiking'));

-- -- Sample data for Product table
-- INSERT INTO "Inventory"."Product" (category_id, name, description, price, stock_quantity) VALUES
-- (25, 'Nike Running Shoes', 'Comfortable running shoes', 120.00, 50),
-- (25, 'Adidas Running Shoes', 'Durable running shoes', 110.00, 40),
-- (25, 'Puma Running Shoes', 'Lightweight running shoes', 100.00, 30),
-- (25, 'Reebok Running Shoes', 'Affordable running shoes', 90.00, 20),
-- (25, 'Asics Running Shoes', 'High-performance running shoes', 130.00, 25),
-- (26, 'Timberland Hiking Boots', 'Durable hiking boots', 150.00, 30),
-- (25, 'Columbia Hiking Boots', 'Comfortable hiking boots', 140.00, 20),
-- (18, 'Giant Road Bike', 'Lightweight road bike', 900.00, 10),
-- (18, 'Trek Mountain Bike', 'Durable mountain bike', 850.00, 15);

-- -- Sample data for Order_Details table
-- INSERT INTO "Inventory"."Order_Details" (order_id, product_id, quantity, unit_price) VALUES
-- (506, 37, 2, 120.00),
-- (507, 38, 1, 110.00),
-- (508, 39, 1, 100.00),
-- (509, 40, 3, 90.00),
-- (510, 41, 1, 130.00),
-- (516, 42, 1, 150.00),
-- (517, 43, 1, 140.00),
-- (518, 44, 2, 900.00),
-- (519, 45, 1, 850.00),
-- (515, 45, 1, 120.00);
----------------------------------------------------------------------