-- Get all customers and their addresses
-- my answer:
-- select c.first_name, c.last_name, a.street, a.city, a.state, a.zip from customers c join addresses a on c.id=a.customer_id;

-- Get all orders and their line items (orders, quantity and product).
-- my answer:
-- select o.id as orderId, li.quantity as productQuantity, p.description as productInOrder from orders as o join line_items as li on o.id=li.order_id join products as p on li.product_id=p.id;

-- Which warehouses have cheetos?
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
-- my answer:
-- select c.id, c.first_name, c.last_name, count(o.id) as numberoforders from customers as c 
-- join addresses as a on c.id=a.customer_id
-- join orders as o on a.id=o.address_id
-- group by c.id
-- order by numberoforders desc;

-- How many customers do we have?
-- my answer:
-- select count(*) as numberofcustomers from customers;



-- How many products do we carry?
-- my answer:
-- select count(*) as numberofproducts from products;

-- What is the total available on-hand quantity of diet pepsi?
-- my answer:
-- select p.description as productname, SUM(whp.on_hand) as totalonhand from products as p
-- join warehouse_product as whp on p.id=whp.product_id
-- where p.description='diet pepsi'
-- group by p.description;
