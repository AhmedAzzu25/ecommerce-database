-- fake_data.sql

-- Insert 100 customers
INSERT INTO "Inventory"."Customers" ("First_Name", "Last_Name", "Email", "password")
SELECT 
    'FirstName' || c,
    'LastName' || c,
    'customer' || c || '@example.com',
    'password' || c
FROM generate_series(1, 100) AS c;

-- Insert root categories
INSERT INTO "Inventory"."Category" (category_name, parent_category_id)
SELECT 
    'Category ' || r,
    NULL
FROM generate_series(1, 20) AS r;  -- Adjust this number if needed for your hierarchy

-- Insert first-level child categories
INSERT INTO "Inventory"."Category" (category_name, parent_category_id)
SELECT 
    'Category ' || r || '.' || f,
    r
FROM generate_series(1, 20) AS r, generate_series(1, 10) AS f;  -- Adjust as needed

-- Insert second-level child categories
INSERT INTO "Inventory"."Category" (category_name, parent_category_id)
SELECT 
    'Category ' || r || '.' || f || '.' || s,
    (r - 1) * 10 + f  -- This calculates the correct parent ID
FROM generate_series(1, 20) AS r, generate_series(1, 10) AS f, generate_series(1, 10) AS s;  -- Adjust as needed

-- Insert 1000 products
INSERT INTO "Inventory"."Product" (category_id, name, description, price, stock_quantity)
SELECT 
    (RANDOM() * 199 + 1)::INTEGER,
    'Product ' || p,
    'Description for Product ' || p,
    (RANDOM() * 100 + 10)::NUMERIC(6, 2),
    (RANDOM() * 100 + 1)::INTEGER
FROM generate_series(1, 1000) AS p;

-- Insert 500 orders
INSERT INTO "Inventory"."Orders" ("OrderDate", "Total_amount", "CustomerID")
SELECT 
    NOW() - (RANDOM() * 365 || ' days')::INTERVAL,
    (RANDOM() * 500 + 50)::NUMERIC(6, 2),
    (RANDOM() * 99 + 1)::INTEGER  -- Ensure CustomerID is between 1 and 100
FROM generate_series(1, 500) AS o;

-- Insert order details
INSERT INTO "Inventory"."Order_Details" ("order_id", "product_id", "quantity", "unit_price")
SELECT 
    (RANDOM() * 499 + 1)::INTEGER,  -- Ensure order_id is between 1 and 500
    (RANDOM() * 999 + 1)::INTEGER,  -- Ensure product_id is between 1 and 1000
    (RANDOM() * 10 + 1)::INTEGER,
    (RANDOM() * 100 + 10)::NUMERIC(6, 2)
FROM generate_series(1, 2000) AS od;
