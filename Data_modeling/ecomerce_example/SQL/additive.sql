-- Additive (can sum)
SELECT SUM(total_amount) FROM fact_sales;

-- Semi-additive (balance-type example)
CREATE TABLE account_balance (
    account_id INT,
    balance DECIMAL,
    date_id INT
);

-- Non-additive example (ratio like %)
SELECT (quantity * 1.0 / SUM(quantity)) * 100 AS sales_ratio
FROM fact_sales;