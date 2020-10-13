-- Get all customers and their addresses....CHECK
-- check what's in these tables
-- select * from customers;
-- select * from addresses;

-- my answer:
-- select c.first_name, c.last_name, a.street, a.city, a.state, a.zip from customers c join addresses a on c.id=a.customer_id;

-- Get all orders and their line items (orders, quantity and product).
--check whats in these tables:
-- select * from orders; --order here
-- select * from line_items; --quantity here
-- select * from products; -- product here
-- my answer:
-- select o.id as orderId, li.quantity as productQuantity, p.description as productInOrder from orders as o join line_items as li on o.id=li.order_id join products as p on li.product_id=p.id;

-- Which warehouses have cheetos?
--check whats in these tables:
-- select * from warehouse;
-- select * from warehouse_product;

-- my answer:
-- select wh.warehouse from warehouse as wh 
-- join warehouse_product as whp on wh.id=whp.warehouse_id 
-- join products as p on whp.product_id=p.id
-- where p.description='cheetos';


-- Which warehouses have diet pepsi?
-- my answer:
-- select wh.warehouse from warehouse as wh 
-- join warehouse_product as whp on wh.id=whp.warehouse_id 
-- join products as p on whp.product_id=p.id
-- where p.description='diet pepsi';


-- Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.


-- How many customers do we have?


-- How many products do we carry?


-- What is the total available on-hand quantity of diet pepsi?
