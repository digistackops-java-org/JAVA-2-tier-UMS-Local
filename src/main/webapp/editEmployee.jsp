<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Employee</title>
</head>
<body>
    <h2>Edit Employee</h2>
    <form action="editEmployee" method="post">
        <input type="hidden" name="id" value="${employee.id}">
        <label>Name:</label><input type="text" name="name" value="${employee.name}" required><br><br>
        <label>Email:</label><input type="email" name="email" value="${employee.email}" required><br><br>
        <label>Designation:</label><input type="text" name="designation" value="${employee.designation}" required><br><br>
        <label>Salary:</label><input type="number" step="0.01" name="salary" value="${employee.salary}" required><br><br>
        <input type="submit" value="Update Employee">
    </form>
    <a href="index.jsp">Back to Home</a>
</body>
</html>