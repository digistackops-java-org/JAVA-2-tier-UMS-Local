# Database Setup
Create "t2.micro" EC2 Instance and open port "5432" for DB 

## Install postgressql  DB
```
sudo dnf update -y
sudo dnf install -y postgresql16-server
which postgresql-setup
```
Initialize the database
```
sudo /usr/bin/postgresql-setup --initdb
```
<img width="579" height="52" alt="image" src="https://github.com/user-attachments/assets/a703cae2-1f67-4e7f-8700-6219399d0021" />


```
sudo systemctl start postgresql
sudo systemctl enable postgresql
```

## Setup postgressql DB

#### Allow Remote Host connect to DB
1. Edit the "postgresql.conf" file in path "/var/lib/pgsql/data/postgresql.conf"
```
sudo vim /var/lib/pgsql/data/postgresql.conf
```
ADD these Under connection settings
```
listen_addresses = '*'
```
<img width="301" height="155" alt="image" src="https://github.com/user-attachments/assets/a6f7607e-7611-4138-8162-d4f8894f0ae3" />

2. Edit the "pg_hba.conf" file in path "/var/lib/pgsql/data/pg_hba.conf"

```
sudo vim /var/lib/pgsql/data/pg_hba.conf
```
ADD these lines 
```
# Allow remote user connections from a single IP
host    all             all             0.0.0.0/0          md5
```
<img width="594" height="225" alt="image" src="https://github.com/user-attachments/assets/749cd77f-a0a9-40b0-a9ae-7b761e22d8f8" />

Restart postgressql DB
```
sudo systemctl restart postgresql
```
#### Create DB and User in database

Switch to postgres User
```
sudo -i -u postgres
```
Login to DB promt
```
psql
```
Change the Passordward for postgres User

```
ALTER USER postgres WITH PASSWORD 'NewStrongPasswordHere';
```

```
SELECT VERSION();
```

Create employee DB
```
CREATE DATABASE employeedb;
```
Create the "appuser" user with password and give full access to employeeDb and its tables
```
CREATE USER appuser WITH PASSWORD 'P@55Word';
```
```
GRANT ALL PRIVILEGES ON DATABASE employeedb TO appuser;
```
Switch to "employedb"
```
\c employeedb;
```
Create the employees table
```
CREATE TABLE employee (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    designation VARCHAR(100) NOT NULL,
    salary NUMERIC(10,2) NOT NULL
);
```
Grant all permissions on the employee table 

```
GRANT SELECT, INSERT, UPDATE, DELETE ON employee TO appuser;
```
Grant usage on the public schema
```
GRANT USAGE ON SCHEMA public TO appuser;
```
Grant permissions to access sequences
```
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO appuser;
```

Check table created or Not under "employedb"
```
SELECT * FROM employee;
```
<img width="346" height="66" alt="image" src="https://github.com/user-attachments/assets/c99e52bb-d44b-4de9-b1d8-a51aa4b07b84" />


# Application server Setup

## Refer "Tools_setup.md" for Installing Required Tools Before execute these steps

### Install Git
```
sudo yum install git -y
```
#### To start this application first you can get the code using below url
##### Clone the Repo

```
sudo git clone https://github.com/techizone-Small-Project-org/JAVA-2-tier-UMS-App.git
```
### Switch to Local-Setup Branch
```
cd JAVA-2-tier-UMS-App
sudo git checkout 01-Local-setup-Dev
```

### Build the Artifact
```
mvn clean package
```
### Deploy these Artifact to Tomcat-Dev
```
sudo cp -r target/*.war /opt/tomcat/webapps
```

### Access Your App in Browser
```
http://<AWS-Public-IP>:8080/employee
```

### To Run the Test
```
mvn test
```
