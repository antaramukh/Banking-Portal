package com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TransferAmt")
public class TransferAmt extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int pin = Integer.parseInt(request.getParameter("pin"));
		int uid = Integer.parseInt(request.getParameter("accn1"));
		try {
			final String JDBC_Driver = "com.mysql.cj.jdbc.Driver";
			final String DB_URL = "jdbc:mysql://localhost/bankproj";
			final String USER = "root";
			final String PASS = "J$esus123";
			
			Connection conn = null;
			PreparedStatement stmt = null;
			PreparedStatement stmt2 = null;
			PreparedStatement stmt3 = null;
			

			Class.forName(JDBC_Driver);
			
			System.out.println("Connecting to selected database...");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			System.out.println("Connected Successfully..");

			System.out.println("Inserting records");
   
		UserDAO userDao = new UserDAO();
        
        try {
            User user = userDao.checkPin(pin, uid);
            String destPage="transfer.jsp";
             
            if (user != null) {
            	if(user.getAmount()>Integer.parseInt(request.getParameter("amt"))) {
            	stmt = conn.prepareStatement("INSERT INTO transaction (customer_id_by,account_id_to,transaction_time,transaction_amount,transaction_type) VALUES (?,?,now(),?,'Transfer')");

           		stmt.setInt(1, Integer.parseInt(request.getParameter("accn1")));
        			stmt.setInt(2, Integer.parseInt(request.getParameter("accn2")));
        			stmt.setInt(3, Integer.parseInt(request.getParameter("amt")));
        			stmt.executeUpdate();
        			System.out.println("Inserted records into table");
        			
        			stmt2 = conn.prepareStatement("update customer set amount=amount-? where customer_id=?");
        			stmt2.setInt(1, Integer.parseInt(request.getParameter("amt")));
        			stmt2.setInt(2, Integer.parseInt(request.getParameter("accn1")));
        			stmt2.executeUpdate();
        			
                    stmt3 = conn.prepareStatement("update customer set amount=amount+? where customer_id=?");
        			stmt3.setInt(1, Integer.parseInt(request.getParameter("amt")));
        			stmt3.setInt(2, Integer.parseInt(request.getParameter("accn2")));
        			stmt3.executeUpdate();
        			
        			String message = "Transaction Successful";
        			request.setAttribute("message", message);
            	}
            	else {
            		String message = "Insufficient Balance";
	    			request.setAttribute("message", message);
            	
            	}	
    			
            } else {
                String message = "Invalid PIN";
                request.setAttribute("message", message);
            }
        
request.getRequestDispatcher("transfer.jsp").forward(request, response);

			
			RequestDispatcher dispatcher = request.getRequestDispatcher("transfer.jsp");
			dispatcher.forward(request, response);
            
        }   catch (SQLException | ClassNotFoundException ex) {
                throw new ServletException(ex);}
		
		
		
	} catch (Exception e) {
		System.out.println("wrong");
		e.printStackTrace();
	}
		
		
		
		
		
	}
	
	
	

}
