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


@WebServlet("/CustReg")
public class CustReg extends HttpServlet {
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
			stmt = conn.prepareStatement("INSERT INTO `bankproj`.`customer` (`cname`, `username`, `password`, `address`, `gender`, `phone`,`email`,bank_branch_id,pin,amount) VALUES (?,?,?,?,?,?,?,?,?,?);");
			
			

			stmt.setString(1, request.getParameter("n1"));
			stmt.setString(2, request.getParameter("un1"));
			stmt.setString(3, request.getParameter("pass"));
			stmt.setString(4, request.getParameter("address"));
			stmt.setString(5, request.getParameter("gender"));
			stmt.setString(6, request.getParameter("mob1"));
			stmt.setString(7, request.getParameter("email"));
			
			
			stmt.setInt(8, Integer.parseInt(request.getParameter("bankid")));
			stmt.setInt(9, Integer.parseInt(request.getParameter("pin")));
			stmt.setInt(10, Integer.parseInt(request.getParameter("amt")));
			
			
			stmt.executeUpdate();
			String message = "Thank You for Registration";
			request.setAttribute("message", message);
			System.out.println("Inserted records into table");
			request.getRequestDispatcher("createacc.jsp").forward(request, response);

			
			RequestDispatcher dispatcher = request.getRequestDispatcher("createacc.jsp");
			dispatcher.forward(request, response);
			
		} catch (Exception e) {
			System.out.println("wrong");
			e.printStackTrace();
		}
	}

}
