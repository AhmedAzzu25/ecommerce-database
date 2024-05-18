--1 
SELECT 
    product_id, 
    name, 
    description, 
    price, 
    stock_quantity 
FROM 
    "Inventory"."Product" 
WHERE 
    LOWER(name) LIKE '%camera%' 
    OR LOWER(description) LIKE '%camera%';

--2
WITH PurchasedProduct AS (
    SELECT 
        p.product_id, 
        p.category_id,
        p.name AS purchased_product_name,
        SUM(od.quantity) AS total_purchased_quantity
    FROM 
        "Inventory"."Product" p
    JOIN 
        "Inventory"."Order_Details" od ON p.product_id = od.product_id
    WHERE 
        p.product_id = 37 -- Replace with the actual purchased product ID
    GROUP BY 
        p.product_id, p.category_id, p.name
),
CategoryProducts AS (
    SELECT 
        p.product_id, 
        p.category_id,
        p.name,
        p.description,
        SUM(od.quantity) AS total_quantity_sold
    FROM 
        "Inventory"."Product" p
    JOIN 
        "Inventory"."Order_Details" od ON p.product_id = od.product_id
    JOIN 
        PurchasedProduct pp ON p.category_id = pp.category_id
    WHERE 
        p.product_id != pp.product_id
    GROUP BY 
        p.product_id, p.category_id, p.name, p.description
)
SELECT 
    cp.product_id, 
    cp.name, 
    cp.description, 
    cp.total_quantity_sold
FROM 
    CategoryProducts cp
ORDER BY 
    cp.total_quantity_sold DESC
LIMIT 10; 

--3:

SELECT "OrderDate" AS "Date", SUM("Total_amount") AS "Total_Revenue"
FROM "Inventory"."Orders"
WHERE "OrderDate" = '"2024-05-02"'
GROUP BY "OrderDate";
--4: 

SELECT p."Name" AS "Product_Name", SUM(od."quantity") AS "Total_Q"
FROM "Inventory"."Product" as p
JOIN "Inventory"."Order_Details" as od ON p."product_Id" = od."product_Id"
JOIN "Inventory"."Orders" as o ON od."order_Id" = o."OrderID"
WHERE EXTRACT(YEAR FROM o."OrderDate") = EXTRACT(YEAR FROM '2024-04-03'::date) AND
      EXTRACT(MONTH FROM o."OrderDate") = EXTRACT(MONTH FROM '2024-04-03'::date)
GROUP BY
    p."Name"
ORDER BY
    "Total_Q" DESC
LIMIT 10;
--5: 
SELECT c."First_Name" || ' ' || c."Last_Name" AS "Customer_Name", SUM(o."Total_amount") AS "Total_Order_Amount"
FROM "Inventory"."Customers" as c
INNER JOIN "Inventory"."Orders" as o ON c."CustomerID" = o."CustomerID"
WHERE
    o."OrderDate" >= DATE_TRUNC('month', CURRENT_DATE) - INTERVAL '1 month'
GROUP BY
    c."CustomerID", c."First_Name", c."Last_Name"
HAVING
    SUM(o."Total_amount") > 500
ORDER BY
    "Total_Order_Amount" DESC;