package com.sapsecopssolutions.servlets;

import com.sapsecopssolutions.utils.DBUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;

@WebServlet("/employee/EditEmployeeServlet")
public class EditEmployeeServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr == null) {
            response.sendRedirect("employeeList.jsp");
            return;
        }

        int id;
        try {
            id = Integer.parseInt(idStr);
        } catch (NumberFormatException e) {
            response.sendRedirect("employeeList.jsp");
            return;
        }

        try (Connection connection = DBUtil.getConnection()) {
            String sql = "SELECT * FROM employees WHERE id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, id);
                try (ResultSet rs = statement.executeQuery()) {
                    if (rs.next()) {
                        request.setAttribute("id", rs.getInt("id"));
                        request.setAttribute("name", rs.getString("name"));
                        request.setAttribute("email", rs.getString("email"));
                        request.setAttribute("designation", rs.getString("designation"));
                        request.setAttribute("salary", rs.getDouble("salary"));
                        request.getRequestDispatcher("editEmployee.jsp").forward(request, response);
                        return;
                    }
                }
            }
            response.sendRedirect("employeeList.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("employeeList.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String designation = request.getParameter("designation");
        String salaryStr = request.getParameter("salary");

        if (idStr == null || name == null || name.isEmpty() || email == null || email.isEmpty() || designation == null || designation.isEmpty() || salaryStr == null || salaryStr.isEmpty()) {
            request.setAttribute("error", "All fields are required.");
            request.getRequestDispatcher("editEmployee.jsp").forward(request, response);
            return;
        }

        int id;
        double salary;
        try {
            id = Integer.parseInt(idStr);
            salary = Double.parseDouble(salaryStr);
            if (salary < 0) throw new NumberFormatException();
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid input.");
            request.getRequestDispatcher("editEmployee.jsp").forward(request, response);
            return;
        }

        try (Connection connection = DBUtil.getConnection()) {
            String sql = "UPDATE employees SET name=?, email=?, designation=?, salary=? WHERE id=?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, name);
                statement.setString(2, email);
                statement.setString(3, designation);
                statement.setDouble(4, salary);
                statement.setInt(5, id);
                statement.executeUpdate();
            }
            response.sendRedirect("employeeList.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error: " + e.getMessage());
            request.getRequestDispatcher("editEmployee.jsp").forward(request, response);
        }
    }
}
