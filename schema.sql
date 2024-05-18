-- sql_files.sql

-- Create the Inventory schema
CREATE SCHEMA IF NOT EXISTS "Inventory"
AUTHORIZATION postgres;

-- Create the Customers table
CREATE TABLE "Inventory"."Customers"
(
    "CustomerID" SERIAL PRIMARY KEY,
    "First_Name" VARCHAR(50) NOT NULL,
    "Last_Name" VARCHAR(50) NOT NULL,
    "Email" VARCHAR(250),
    "password" VARCHAR(100)
);

-- Create the Orders table
CREATE TABLE "Inventory"."Orders"
(
    "OrderID" SERIAL PRIMARY KEY,
    "OrderDate" DATE,
    "Total_amount" NUMERIC(6,2) NOT NULL CHECK ("Total_amount" >= 0),
    "CustomerID" INTEGER,
    CONSTRAINT "Customer_Orders_Constrain" FOREIGN KEY ("CustomerID")
    REFERENCES "Inventory"."Customers" ("CustomerID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
);

-- Create the Category table
CREATE TABLE "Inventory"."Category"
(
    "category_id" SERIAL PRIMARY KEY,
    "category_name" VARCHAR(50),
    "parent_category_id" INTEGER,
    CONSTRAINT "fk_parent_category" FOREIGN KEY ("parent_category_id")
    REFERENCES "Inventory"."Category" ("category_id")
);

-- Create the Product table
CREATE TABLE "Inventory"."Product"
(
    "product_id" SERIAL PRIMARY KEY,
    "category_id" INTEGER,
    "name" VARCHAR(50),
    "description" TEXT,
    "price" MONEY,
    "stock_quantity" INTEGER NOT NULL CHECK ("stock_quantity" > 0),
    CONSTRAINT "Category_Product_Constrain" FOREIGN KEY ("category_id")
    REFERENCES "Inventory"."Category" ("category_id")
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
);

-- Create the Order_Details table
CREATE TABLE "Inventory"."Order_Details"
(
    "order_detail_id" SERIAL PRIMARY KEY,
    "order_id" INTEGER,
    "product_id" INTEGER,
    "quantity" INTEGER,
    "unit_price" MONEY,
    CONSTRAINT "order_detail_constrain" FOREIGN KEY ("order_id")
    REFERENCES "Inventory"."Orders" ("OrderID")
    ON UPDATE NO ACTION
    ON DELETE NO ACTION,
    CONSTRAINT "Product_orderDetail_constrain" FOREIGN KEY ("product_id")
    REFERENCES "Inventory"."Product" ("product_id")
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
);