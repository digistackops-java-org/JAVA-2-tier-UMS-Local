-- Run this in the 'postgres' database
CREATE DATABASE employeedb;
CREATE USER appuser WITH PASSWORD 'P@55Word';
GRANT ALL PRIVILEGES ON DATABASE employeedb TO appuser;
\c employeedb;
CREATE TABLE employee (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    designation VARCHAR(100) NOT NULL,
    salary NUMERIC(10,2) NOT NULL
);
GRANT SELECT, INSERT, UPDATE, DELETE ON employee TO appuser;
GRANT USAGE ON SCHEMA public TO appuser;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO appuser;
SELECT * FROM employee;
