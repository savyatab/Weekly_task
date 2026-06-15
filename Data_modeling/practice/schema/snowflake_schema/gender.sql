CREATE TABLE gender(
    gender_id SERIAL PRIMARY KEY,
    gender_name TEXT
);

INSERT INTO gender (gender_name)
VALUES ('M'), ('F');