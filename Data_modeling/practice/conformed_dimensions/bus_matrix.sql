--Bus Matrix-->a design of blueprint(table)that shows which fact tables uses usses which dimensions
-- we donot create table but we only execute

SELECT 'orders ' as fact_name, user_id  from fact_orders;
SELECT 'shipments' AS fact_name, user_id FROM fact_shipments;