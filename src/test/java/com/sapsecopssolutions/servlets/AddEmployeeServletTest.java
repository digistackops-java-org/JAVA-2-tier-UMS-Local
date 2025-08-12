package com.sapsecopssolutions.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

import static org.mockito.Mockito.*;

public class AddEmployeeServletTest extends Mockito {

    @Test
    public void testDoPostValidData() throws Exception {
        AddEmployeeServlet servlet = new AddEmployeeServlet();

        HttpServletRequest request = mock(HttpServletRequest.class);
        HttpServletResponse response = mock(HttpServletResponse.class);

        when(request.getParameter("name")).thenReturn("Test User");
        when(request.getParameter("email")).thenReturn("testuser@example.com");
        when(request.getParameter("designation")).thenReturn("Developer");
        when(request.getParameter("salary")).thenReturn("50000");

        doNothing().when(response).sendRedirect("employeeList.jsp");

        servlet.doPost(request, response);

        verify(response, times(1)).sendRedirect("employeeList.jsp");
    }

    @Test
    public void testDoPostMissingData() throws Exception {
        AddEmployeeServlet servlet = new AddEmployeeServlet();

        HttpServletRequest request = mock(HttpServletRequest.class);
        HttpServletResponse response = mock(HttpServletResponse.class);
        RequestDispatcher dispatcher = mock(RequestDispatcher.class);

        when(request.getParameter("name")).thenReturn("");
        when(request.getParameter("email")).thenReturn("testuser@example.com");
        when(request.getParameter("designation")).thenReturn("Developer");
        when(request.getParameter("salary")).thenReturn("50000");

        when(request.getRequestDispatcher("addEmployee.jsp")).thenReturn(dispatcher);

        servlet.doPost(request, response);

        verify(dispatcher).forward(request, response);
    }
}