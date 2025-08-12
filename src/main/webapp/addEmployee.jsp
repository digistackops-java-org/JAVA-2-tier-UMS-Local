<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Employee</title>
</head>
<body>
    <h2>Add New Employee</h2>
    <form action="addEmployee" method="post">
        <label>Name:</label><input type="text" name="name" required><br><br>
        <label>Email:</label><input type="email" name="email" required><br><br>
        <label>Designation:</label><input type="text" name="designation" required><br><br>
        <label>Salary:</label><input type="number" step="0.01" name="salary" required><br><br>
        <input type="submit" value="Add Employee">
    </form>
    <a href="index.jsp">Back to Home</a>
</body>
</html>