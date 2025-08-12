```
CREATE TABLE employees (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  designation VARCHAR(255) NOT NULL,
  salary NUMERIC(12, 2) NOT NULL
);
```