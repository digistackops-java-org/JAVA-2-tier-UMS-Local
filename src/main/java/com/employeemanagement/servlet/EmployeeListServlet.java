package com.employeemanagement.servlet;

import com.employeemanagement.dao.EmployeeDAO;
import com.employeemanagement.model.Employee;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/employeeList")
public class EmployeeListServlet extends HttpServlet {
    private EmployeeDAO employeeDAO;

    public void init() {
        employeeDAO = new EmployeeDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Employee> listEmployee = employeeDAO.listAllEmployees();
            request.setAttribute("listEmployee", listEmployee);
            request.getRequestDispatcher("employeeList.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}