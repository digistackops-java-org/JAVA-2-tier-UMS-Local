<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee List</title>
</head>
<body>
    <h2>Employee List</h2>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Designation</th>
            <th>Salary</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="employee" items="${listEmployee}">
            <tr>
                <td>${employee.id}</td>
                <td>${employee.name}</td>
                <td>${employee.email}</td>
                <td>${employee.designation}</td>
                <td>${employee.salary}</td>
                <td>
                    <a href="editEmployee?id=${employee.id}"><button>Edit</button></a>
                    <a href="deleteEmployee?id=${employee.id}" onclick="return confirm('Are you sure?')"><button>Delete</button></a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <br>
    <a href="index.jsp">Back to Home</a>
</body>
</html>