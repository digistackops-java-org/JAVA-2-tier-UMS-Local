-- Create the database
CREATE DATABASE employeedb;

-- Connect to the database
\c employeedb;

-- Create the employee table
CREATE TABLE employee (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    designation VARCHAR(100) NOT NULL,
    salary NUMERIC(10,2) NOT NULL
);