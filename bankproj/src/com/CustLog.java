package com;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/CustLog")
public class CustLog extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("un1");
        String password = request.getParameter("pass");
         
        UserDAO userDao = new UserDAO();
         
        try {
            User user = userDao.checkLogin(email, password);
            String destPage="custlogin.jsp";
             
            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                session.setAttribute("userid", user.getBid());
                destPage = "dashboard.jsp";
            } else {
                String message = "Invalid Username or Password";
                request.setAttribute("message", message);
            }
             
            RequestDispatcher dispatcher = 
            		request.getRequestDispatcher(destPage);
            dispatcher.forward(request, response);
        
             
        } catch (SQLException | ClassNotFoundException ex) {
            throw new ServletException(ex);
        }
	}

}
