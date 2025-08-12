package com.sapsecopssolutions.servlets;

import com.sapsecopssolutions.utils.DBUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmployeeServlet extends HttpServlet {

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
            String sql = "DELETE FROM employees WHERE id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, id);
                statement.executeUpdate();
            }
            response.sendRedirect("employeeList.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("employeeList.jsp");
        }
    }
}
