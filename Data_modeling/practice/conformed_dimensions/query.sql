SELECT o.order_id ,u.user_name ,o.amount
FROM    fact_orders o 
JOIN dim_user u 
ON o.user_id = u.user_id;

SELECT s.shipment_id, u.city, s.delivery_days
FROM fact_shipments s
JOIN dim_user u
ON s.user_id = u.user_id;

--one dimension table used everywhere