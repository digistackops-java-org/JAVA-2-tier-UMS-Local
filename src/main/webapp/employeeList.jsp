<%@ page import="java.sql.*" %>
<%@ page import="com.sapsecopssolutions.utils.DBUtil" %>
<!DOCTYPE html>
<html>
<head>
  <title>Employee List</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
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
      margin-top: 40px;
    }
    h2 {
      text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
    }
    table thead {
      background: #8e44ad;
    }
    table tbody tr:hover {
      background: rgba(255,255,255,0.1);
    }
    .btn-primary { background: #8e44ad; border: none; }
    .btn-primary:hover { background: #732d91; }
    .btn-danger { background: #c0392b; border: none; color: white; }
    .btn-danger:hover { background: #992d22; }
    .btn-success { background: #27ae60; border: none; }
    .btn-success:hover { background: #1e8449; }
    .btn-secondary { background: #34495e; border: none; color: #ccc; }
    .btn-secondary:hover { background: #2c3e50; color: #fff; }
  </style>
</head>
<body>
  <div class="container">
    <h2>Employee List</h2>
    <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-secondary mb-3">Home</a>
    <a href="${pageContext.request.contextPath}/addEmployee.jsp" class="btn btn-success mb-3 float-end">Add New Employee</a>
    <table class="table table-bordered table-striped text-white">
      <thead>
        <tr>
          <th>ID</th>
          <th>Name</th>
          <th>Email</th>
          <th>Designation</th>
          <th>Salary</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
      <%
        try (Connection conn = DBUtil.getConnection()) {
          String sql = "SELECT * FROM employees ORDER BY id";
          try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            try (ResultSet rs = stmt.executeQuery()) {
              while (rs.next()) {
      %>
                <tr>
                  <td><%= rs.getInt("id") %></td>
                  <td><%= rs.getString("name") %></td>
                  <td><%= rs.getString("email") %></td>
                  <td><%= rs.getString("designation") %></td>
                  <td><%= rs.getDouble("salary") %></td>
                  <td>
                    <a href="${pageContext.request.contextPath}/EditEmployeeServlet?id=<%= rs.getInt("id") %>" class="btn btn-sm btn-primary">Edit</a>
                    <a href="${pageContext.request.contextPath}/DeleteEmployeeServlet?id=<%= rs.getInt("id") %>" class="btn btn-sm btn-danger" onclick="return confirm('Delete this employee?');">Delete</a>
                  </td>
                </tr>
      <%
              }
            }
          }
        } catch (Exception e) {
          out.println("<tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>");
        }
      %>
      </tbody>
    </table>
  </div>
</body>
</html>
