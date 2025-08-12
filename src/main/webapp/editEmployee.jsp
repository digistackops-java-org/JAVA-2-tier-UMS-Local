<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>Edit Employee</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    /* Same styling as addEmployee.jsp */
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
      max-width: 600px;
      margin-top: 40px;
    }
    h2 {
      text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
    }
    .btn-primary {
      background: #8e44ad;
      border: none;
    }
    .btn-primary:hover {
      background: #732d91;
    }
    .btn-secondary {
      background: #34495e;
      border: none;
      color: #ccc;
    }
    .btn-secondary:hover {
      background: #2c3e50;
      color: #fff;
    }
    .alert-danger {
      background: #c0392b;
      border: none;
      color: white;
    }
  </style>
</head>
<body>
  <div class="container">
    <h2>Edit Employee</h2>
    <form action="EditEmployeeServlet" method="post">
      <input type="hidden" name="id" value="${id}" />
      <div class="mb-3">
        <label for="name" class="form-label">Name</label>
        <input type="text" name="name" id="name" class="form-control" value="${name}" required>
      </div>
      <div class="mb-3">
        <label for="email" class="form-label">Email</label>
        <input type="email" name="email" id="email" class="form-control" value="${email}" required>
      </div>
      <div class="mb-3">
        <label for="designation" class="form-label">Designation</label>
        <input type="text" name="designation" id="designation" class="form-control" value="${designation}" required>
      </div>
      <div class="mb-3">
        <label for="salary" class="form-label">Salary</label>
        <input type="number" name="salary" id="salary" class="form-control" step="0.01" value="${salary}" required>
      </div>
      <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
      </c:if>
      <button type="submit" class="btn btn-primary">Update Employee</button>
      <a href="employeeList.jsp" class="btn btn-secondary">Cancel</a>
    </form>
  </div>
</body>
</html>
