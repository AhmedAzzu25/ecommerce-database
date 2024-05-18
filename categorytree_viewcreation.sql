CREATE VIEW "Inventory"."CategoryTree" AS
WITH RECURSIVE CategoryTree AS (
    -- (those without a parent)
    SELECT 
        category_id AS parent_category_id,
        category_name,
        category_id AS child_category_id,
        category_name::VARCHAR AS path
    FROM 
        "Inventory"."Category"
    WHERE 
        parent_category_id IS NULL
    
    UNION ALL
    
    -- Recursive member:
    SELECT 
        ct.parent_category_id,
        c.category_name,
        c.category_id AS child_category_id,
        (ct.path || ' > ' || c.category_name)::VARCHAR AS path
    FROM 
        CategoryTree ct
    JOIN 
        "Inventory"."Category" c ON ct.child_category_id = c.parent_category_id
)
SELECT 
    parent_category_id,
    path AS category_tree,
    child_category_id
FROM 
    CategoryTree
ORDER BY 
    parent_category_id, child_category_id;

----------------------------------------------------------------------------------------
SELECT 
    parent_category_id,
    category_tree,
    child_category_id
FROM 
    "Inventory"."CategoryTree";
