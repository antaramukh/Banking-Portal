package com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddBank
 */
@WebServlet("/AddBank")
public class AddBank extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			final String JDBC_Driver = "com.mysql.cj.jdbc.Driver";
			final String DB_URL = "jdbc:mysql://localhost/bankproj";
			final String USER = "root";
			final String PASS = "J$esus123";
			
			Connection conn = null;
			PreparedStatement stmt = null;

			Class.forName(JDBC_Driver);
			
			System.out.println("Connecting to selected database...");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			System.out.println("Connected Successfully..");

			System.out.println("Inserting records");
			stmt = conn.prepareStatement("INSERT INTO `bankproj`.`bank_branch` (`name`, `location`) VALUES (?,?);");
			
			

			stmt.setString(1, request.getParameter("n1"));
			stmt.setString(2, request.getParameter("loc"));
		
			
			
			stmt.executeUpdate();
			System.out.println("Inserted records into table");
			String message = "Added Successful";
			request.setAttribute("message", message);
			request.getRequestDispatcher("addbank.jsp").forward(request, response);

			
			RequestDispatcher dispatcher = request.getRequestDispatcher("addbank.jsp");
			dispatcher.forward(request, response);
			
		} catch (Exception e) {
			String message = "Could Not Add";
			request.setAttribute("message", message);
			System.out.println("wrong");
			e.printStackTrace();
		}
	}

}
