INSERT INTO "Inventory"."Customers" ("CustomerID", "First_Name", "Last_Name", "Email", "password")
VALUES
    (1, 'John', 'Doe', 'john@example.com',  'Qy2hvqCka3bKEPR6wj'),
    (2, 'Alice', 'Smith', 'alice@example.com', 'tBj6G2NWwVTAUR5dgZ'),
    (3, 'Emma', 'Johnson', 'emma@example.com', 'kYNpQKz8Xs3h7L6SAv'),
    (4, 'Michael', 'Brown', 'michael@example.com', 'z8wtvFpBqQ2M65eSCH'),
    (5, 'Sophia', 'Lee', 'sophia@example.com', 'M3JLHavVdhFyB2euYx');
	
	
INSERT INTO "Inventory"."Orders" ("OrderID", "OrderDate", "Total_amount", "CustomerID")
VALUES
    (101, '2024-05-01', 150.00, 1),
    (102, '2024-05-02', 300.00, 2),
	(103, '2024-04-03', 200.00, 3),
    (104, '2024-04-04', 550.00, 4),
    (112, '2024-04-12', 600.00, 5);
	
INSERT INTO "Inventory"."Category" ("category_Id", "Category_name")
VALUES
    (1, 'Electronics'),
    (2, 'Clothing'),
	(3, 'Home Appliances'),
    (4, 'Books'),
    (5, 'Toys');
	
INSERT INTO "Inventory"."Product" ("product_Id", "category_Id", "Name", "description", "price", "stock_quantity")
VALUES
    (101, 1, 'Smartphone', 'High-end smartphone', 500.00, 50),
    (102, 2, 'T-Shirt', 'Cotton T-shirt', 20.00, 100),
	(103, 3, 'Refrigerator', 'Energy-efficient refrigerator', 800.00, 20),
    (104, 4, 'Science Fiction Book', 'Bestseller sci-fi novel', 25.00, 50),
    (112, 5, 'Lego Set', 'Creative building blocks', 30.00, 100);
	
INSERT INTO "Inventory"."Order_Details" ("order_detail_Id", "order_Id", "product_Id", "quantity", "unit_price")
VALUES
    (1001, 101, 101, 2, 250.00),
    (1002, 102, 102, 5, 100.00),
	(1003, 103, 103, 1, 200.00),
    (1004, 104, 104, 2, 70.00),
    (1005, 112, 112, 3, 90.00);