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



public class AdminDAO {
	public AdminUser checkAdLogin(String uname, String password) 
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
  String sql = "SELECT * FROM `bankproj`.`admin`  WHERE username = ?" + " and password = ?";

  PreparedStatement statement = conn.prepareStatement(sql);
  statement.setString(1, uname);
  statement.setString(2, password);

  ResultSet result = statement.executeQuery();

  AdminUser aduser = null;

  if (result.next()) {
      aduser = new AdminUser();
      aduser.setUname(result.getString("username"));
      aduser.setPassword(result.getString("password"));
 }
  

  conn.close();

  return aduser;
    	
  

}

}