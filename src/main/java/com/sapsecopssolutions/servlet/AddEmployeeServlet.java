package com.sapsecopssolutions.servlets;

import com.sapsecopssolutions.utils.DBUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/employee/AddEmployeeServlet")
public class AddEmployeeServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String designation = request.getParameter("designation");
        String salaryStr = request.getParameter("salary");

        if (name == null || name.isEmpty() || email == null || email.isEmpty() || designation == null || designation.isEmpty() || salaryStr == null || salaryStr.isEmpty()) {
            request.setAttribute("error", "All fields are required.");
            request.getRequestDispatcher("addEmployee.jsp").forward(request, response);
            return;
        }

        double salary;
        try {
            salary = Double.parseDouble(salaryStr);
            if (salary < 0) throw new NumberFormatException();
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid salary.");
            request.getRequestDispatcher("addEmployee.jsp").forward(request, response);
            return;
        }

        try (Connection connection = DBUtil.getConnection()) {
            String sql = "INSERT INTO employees (name, email, designation, salary) VALUES (?, ?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, name);
                statement.setString(2, email);
                statement.setString(3, designation);
                statement.setDouble(4, salary);

                statement.executeUpdate();
            }
            response.sendRedirect("employeeList.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error: " + e.getMessage());
            request.getRequestDispatcher("addEmployee.jsp").forward(request, response);
        }
    }
}
