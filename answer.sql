-- 1. Get all customers and their addresses
-- my answer:
-- select c.first_name, c.last_name, a.street, a.city, a.state, a.zip 
-- from customers c 
-- join addresses a on c.id=a.customer_id;

-- 2. Get all orders and their line items (orders, quantity and product).
-- my answer:
-- select o.id as orderId, li.quantity as productQuantity, p.description as productInOrder 
-- from orders as o 
-- join line_items as li on o.id=li.order_id 
-- join products as p on li.product_id=p.id;

-- 3. Which warehouses have cheetos?
-- my answer:
-- select wh.warehouse from warehouse as wh 
-- join warehouse_product as whp on wh.id=whp.warehouse_id 
-- join products as p on whp.product_id=p.id
-- where p.description='cheetos';


-- 4. Which warehouses have diet pepsi?
-- my answer:
-- select wh.warehouse from warehouse as wh 
-- join warehouse_product as whp on wh.id=whp.warehouse_id 
-- join products as p on whp.product_id=p.id
-- where p.description='diet pepsi';


-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
-- my answer:
-- select c.id, c.first_name, c.last_name, count(o.id) as numberoforders from customers as c 
-- join addresses as a on c.id=a.customer_id
-- join orders as o on a.id=o.address_id
-- group by c.id
-- order by numberoforders desc;

-- 6. How many customers do we have?
-- my answer:
-- select count(*) as numberofcustomers from customers;

-- 7. How many products do we carry?
-- my answer:
-- select count(*) as numberofproducts from products;

-- 8. What is the total available on-hand quantity of diet pepsi?
-- my answer:
-- select p.description as productname, SUM(whp.on_hand) as totalonhand from products as p
-- join warehouse_product as whp on p.id=whp.product_id
-- where p.description='diet pepsi'
-- group by p.description;

--STRETCH below:

-- 9. How much was the total cost for each order?
-- my answer:
-- select o.id as orderId, SUM((li.quantity*p.unit_price)) as totalcost
-- from orders as o 
-- join line_items as li on o.id=li.order_id 
-- join products as p on li.product_id=p.id
-- group by o.id
-- order by o.id;

-- 10. How much has each customer spent in total?
-- my answer:
-- select c.id as customerid, c.first_name, c.last_name, SUM(li.quantity*p.unit_price) as totalspent
-- from customers c 
-- join addresses a on c.id=a.customer_id
-- join orders o on a.id = o.address_id
-- join line_items li on o.id=li.order_id
-- join products p on li.product_id=p.id
-- group by c.id
-- order by c.id;


-- 11. How much has each customer spent in total? Customers who have spent $0 should still show up in the table. It should say 0, not NULL (research coalesce).
-- my answer:
-- select c.id, c.first_name, c.last_name, SUM(coalesce(li.quantity,0)*coalesce(p.unit_price,0))
-- from customers c 
-- full join addresses a on c.id=a.customer_id
-- full join orders o on a.id = o.address_id
-- full join line_items li on o.id=li.order_id
-- full join products p on li.product_id=p.id
-- group by c.id
-- order by c.id;