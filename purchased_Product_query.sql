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
