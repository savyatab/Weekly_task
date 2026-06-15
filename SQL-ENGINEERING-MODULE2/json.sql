-- -- jsON --> USED TO STORE SEMI STRUCTURED DATA INSIDE A DB


CREATE TABLE customer_json (
    id SERIAL PRIMARY KEY,
    details JSONB --jsonb stores json in binary optimized format(jsonb) for faster query
);

INSERT INTO customer_json(details)
VALUES
('{
"name":"Sumit",
"city":"Kathmandu"
}');

SELECT details->>'name' AS customer_name
FROM customer_json;