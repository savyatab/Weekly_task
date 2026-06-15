--customer generating higher revenue
SELECT
  customer_name,
  SUM(total_amount) AS revenue
FROM fact_sales as f
JOIN dim_customer c
ON f.customer_id = c.customer_id
GROUP BY customer_name
ORDER BY revenue DESC;

--WHICH PRODUCT IS SELLED MOSTLY
SELECT
    product_name,
    SUM(quantity) AS total_quantity
FROM fact_sales f
JOIN dim_product p
ON f.product_id = p.product_id
GROUP BY product_name
ORDER BY total_quantity DESC;

--total sales amount
SELECT SUM(total_amount) AS total_sales
FROM fact_sales;