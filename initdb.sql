-- Create database
CREATE DATABASE mydb;

-- Create user (if not exists)
CREATE USER appuser WITH PASSWORD 'P@55Word';

-- Grant privileges on the DB
GRANT ALL PRIVILEGES ON DATABASE mydb TO appuser;

\connect mydb;

-- Create tables
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    course VARCHAR(50),
    fees NUMERIC,
    status VARCHAR(20)
);

-- Insert sample data
INSERT INTO students (name, email, course, fees, status)
VALUES 
('Alice', 'alice@example.com', 'Math', 5000, 'paid'),
('Bob', 'bob@example.com', 'Science', 4500, 'pending');
