<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>SapSecOps Solutions - Employee Salary Tracker</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    /* Styling from earlier */
    body {
      background: linear-gradient(135deg, #71b7e6, #9b59b6);
      min-height: 100vh;
      color: #fff;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    .container {
      background: rgba(0, 0, 0, 0.6);
      border-radius: 15px;
      padding: 30px;
      box-shadow: 0 8px 24px rgba(0,0,0,0.3);
    }
    h1 {
      text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
    }
    .btn-primary {
      background: #8e44ad;
      border: none;
    }
    .btn-primary:hover {
      background: #732d91;
    }
    .btn-success {
      background: #27ae60;
      border: none;
    }
    .btn-success:hover {
      background: #1e8449;
    }
  </style>
</head>
<body>
  <div class="container text-center mt-5">
    <h1>Welcome to SapSecOps Solutions Pvt Ltd.</h1>
    <p class="lead">Very Good Training center for DevOps with AWS, Python & AWS Solution Architect in Bangalore India.</p>
    <hr>
    <a href="addEmployee.jsp" class="btn btn-primary m-2">Add Employee</a>
    <a href="employeeList.jsp" class="btn btn-success m-2">Employee List</a>
  </div>
</body>
</html>
