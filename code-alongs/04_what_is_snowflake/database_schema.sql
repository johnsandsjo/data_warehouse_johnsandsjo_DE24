SHOW DATABASES;

CREATE DATABASE IF NOT EXISTS demo_db;

USE DATABASE demo_db;

SHOW SCHEMAS;

CREATE SCHEMA IF NOT EXISTS demo_db.staging;

SHOW SCHEMAS IN demo_db;

CREATE TABLE IF NOT EXISTS customer(
    customer_id integer PRIMARY KEY,
    age integer,
    email varchar(50)
);

SHOW TABLES;

SELECT * FROM customer;

INSERT INTO CUSTOMER (customer_id, age, email)
VALUES
(1, 32, 'abc@mail.com'),
(2, 35, 'cde@mail.com');

SELECT * FROM customer;

DROP DATABASE demo_db;

SHOW DATABASES;