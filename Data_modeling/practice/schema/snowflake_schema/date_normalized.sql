CREATE TABLE dim_dates (
    date_id SERIAL PRIMARY KEY,
    full_date DATE,
    year INT,
    month_id INT REFERENCES month(month_id)
);

INSERT INTO dim_dates(full_date, year, month_id)
VALUES ('2026-01-01', 2026, 1);