package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class UserDAO {
	public User checkLogin(String uname, String password) 
			throws SQLException,
    ClassNotFoundException {

    	// JDBC driver name and database URL
    	    final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";  
    	    final String DB_URL = "jdbc:mysql://localhost/bankproj";

    	   //  Database credentials
    	    final String USER = "root";
    	   final String PASS = "J$esus123";
    	System.out.println("hi");
    	Connection conn = null;
//STEP 2: Register JDBC driver
    	Class.forName(JDBC_DRIVER);

  //STEP 3: Open a connection

  conn = DriverManager.getConnection(DB_URL, USER, PASS);
  String sql = "SELECT * FROM `bankproj`.`customer`  WHERE username = ?" + " and password = ?";

  PreparedStatement statement = conn.prepareStatement(sql);
  statement.setString(1, uname);
  statement.setString(2, password);

  ResultSet result = statement.executeQuery();

  User user = null;

  if (result.next()) {
      user = new User();
      user.setUname(result.getString("username"));
      user.setPassword(result.getString("password"));
      user.setAddress(result.getString("address"));
      user.setPhone(result.getString("phone"));
      user.setCname(result.getString("cname"));
      user.setBid(result.getInt("customer_id"));
      user.setAmount(result.getInt("amount"));
      user.setPin(result.getInt("pin"));
     
      
  }
  

  conn.close();

  return user;
    	
  

}
	
	public User checkPin(int pin,int cid) 
			throws SQLException,
    ClassNotFoundException {

    	// JDBC driver name and database URL
    	    final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";  
    	    final String DB_URL = "jdbc:mysql://localhost/bankproj";

    	   //  Database credentials
    	    final String USER = "root";
    	   final String PASS = "J$esus123";
    	System.out.println("hi");
    	Connection conn = null;
//STEP 2: Register JDBC driver
    	Class.forName(JDBC_DRIVER);

  //STEP 3: Open a connection

  conn = DriverManager.getConnection(DB_URL, USER, PASS);
  String sql = "SELECT * FROM `bankproj`.`customer`  WHERE customer_id = ?" + " and pin = ?";

  PreparedStatement statement = conn.prepareStatement(sql);
  
  statement.setInt(1, cid);
  statement.setInt(2, pin);

  ResultSet result = statement.executeQuery();

  User user = null;

  if (result.next()) {
      user = new User();
      user.setUname(result.getString("username"));
      user.setPassword(result.getString("password"));
      user.setAddress(result.getString("address"));
      user.setPhone(result.getString("phone"));
      user.setCname(result.getString("cname"));
      user.setBid(result.getInt("customer_id"));
      user.setCuid(result.getInt("bank_branch_id"));
      user.setAmount(result.getInt("amount"));
      user.setPin(result.getInt("pin"));
     
      
  }
  

  conn.close();

  return user;
    	
  

}

}
