<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<!DOCTYPE html>
<html>
<head>
<style>
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
   -webkit-appearance: none;
   margin: 0;
}
input[type="number"] {
   -moz-appearance: textfield;
}
.header {
  overflow: hidden;

  padding: 10px 10px;
  font-family: 'Poppins', sans-serif;
}
.header a {
  float: left;
  text-align: center;
  padding: 2px;
  text-decoration: none;
  font-size: 18px;
  line-height: 25px;
  border-radius: 4px;
}
body{
background: #DAE2F8; 
background: linear-gradient(to right, #D6A4A4, #DAE2F8); 
font-family: 'Poppins', sans-serif;
}
a{
border:1px solid white; 
color:black; 
padding: 10px 29px;
text-transform: uppercase;
width: 150px; 
text-decoration: none;
}
h1{
text-align:center; 
font-size: 40px; 
border:1px solid white; 
font-weight:100; 
PADDING:15PX;
text-transform: uppercase;
}
</style>
<div class="header">
<a href="homepage.jsp" class="logo" >Home Page</a>
</div>
<meta charset="ISO-8859-1">
<title>Create Account</title>
</head>
<body>
<h1>Open Account</h1>
<form action="CustReg" method="post">
<table align="center">
<tr> 
<td>Enter Name:</td>
<td style="padding:15px;"><input type="text" name="n1" required/></td>
</tr>
<tr> 
<td>Enter Username:</td>
<td style="padding:15px;"><input type="text" name="un1" required/></td>
</tr>
<tr>
<td>Enter Password:</td>
<td style="padding:15px;"><input type="password" name="pass" required/></td>
</tr>
<tr> 
<td>Enter Address:</td>
<td style="padding:15px;"><input type="text" name="address" required/></td>
</tr>
<tr> 
<td>Enter Phone:</td>
<td style="padding:15px;"><input type="text" name="mob1" required/></td>
</tr>
<tr> 
<td>Enter Email:</td>
<td style="padding:15px;"><input type="text" name="email" required/></td>
</tr>
<tr> 
<td>Select Gender:</td>
<td style="padding:15px; width:15px;"><select name="gender" required>
<option value="" selected disabled hidden> Select an Option </option>
<option value="F">F</option>
<option value="M">M</option>
</select></td>
</tr> 
<tr> 
<%
    try{
    	Class.forName("com.mysql.jdbc.Driver");
    	String url="jdbc:mysql://localhost/bankproj";
    	String username="root";
    	String password="J$esus123";
    	String query="select * from bank_branch";

    	Connection conn=DriverManager.getConnection(url,username,password);
    	Statement stmt=conn.createStatement();
    	ResultSet rs=stmt.executeQuery(query);
%>

<td>Select Bank:</td>
<td style="padding:15px;">     <select name="bankid" required>
<option value="" selected disabled hidden> Select an Option </option>
<%  while(rs.next()){ %>
<option value="<%= rs.getInt(1)%>"> <%= rs.getString(2)%></option>
<% } %>
</select></td>
</tr> 
<%
	}
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>

<tr> 
<td>Set PIN:</td>
<td style="padding:15px;"><input type="password" name="pin" required/></td>
</tr>
<tr> 
<td>Starting Amount:</td>
<td style="padding:15px;"><input type="number" name="amt" required/></td>
</tr>
<tr>
<td colspan="2" align="center">
<input type="submit" value="Register" 
style="background: none;color:; padding: 10px 10px;text-transform: uppercase;width: 235px;"></td>
</tr>
</table>
</form>
<table align="center">
<tr> 
<td align="center">${message}
</tr>
</table>
<br>
<div style="text-align: center">
<a href=custlogin.jsp>
Already have an account? LOGIN</a>
</div>
<br> <br> <br> <br>
</body>
</html>