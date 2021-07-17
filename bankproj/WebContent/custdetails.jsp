<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="javax.servlet.RequestDispatcher" %>
<%@ page import="javax.servlet.http.HttpServlet" %>
<%@ page import="com.User" %>
<% 
HttpSession session1 = request.getSession();
if (session1.getAttribute("user") == null) {
	response.sendRedirect("custlogin.jsp");
    return;
} else {
    
}
%>
<!DOCTYPE html>
<html>
<head>
<style>
body{
font-family: 'Poppins', sans-serif;
background: #DAE2F8; 
background: linear-gradient(to right, #D6A4A4, #DAE2F8); 
}
h1{
text-align:center; 
font-size: 40px; 
border:1px solid white; 
font-weight:100; 
PADDING:20PX;
}
table, tr, td {
  border: 1px solid WHITE;
  font-family: 'Poppins', sans-serif;
  
}

th, td {
  padding: 10px;
  font-family: 'Poppins', sans-serif;
}
</style>
<meta charset="ISO-8859-1">
<title>Account Details</title>
</head>
<body>
 <jsp:include page="custheader.jsp"></jsp:include> 
 <h1>Account Details</h1>


 <p style="visibility: hidden;">user = new User();
<table align="center">
	<tr>
		<td><b>Account Number</b></td>
		<td>${user.bid}</td>
	</tr>
	
	<tr>
		<td><b>Username</b></td>
		<td>${user.uname}</td>
	</tr>
	<tr>
		<td><b>Full Name</b></td>
		<td>${user.cname}</td>
	</tr>
	<tr>
		<td><b>Address</b></td>
		<td>${user.address}</td>
	</tr>
	<tr>
		<td><b>Phone</b></td>
		<td>${user.phone}</td>
	</tr>
	
<%
try
{
	User user = new User(); 
	String value=request.getSession().getAttribute("userid").toString();
	int i=Integer.parseInt(value);  

Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/bankproj";
String username="root";
String password="J$esus123";
String query="SELECT * FROM `bankproj`.`customer` where customer_id="+i+"";
Connection conn=DriverManager.getConnection(url,username,password);
Statement stmt=conn.createStatement();
PreparedStatement statement = conn.prepareStatement(query);
ResultSet rs=stmt.executeQuery(query);

while(rs.next())
{
%>

 <tr>
 	<td><b>Balance</b></td>
		<td>Rs. <%=rs.getInt("amount") %></td>
	</tr>
 <%
}
%>
<%
    rs.close();
    stmt.close();
    conn.close();
    }
catch(Exception e)
{
    e.printStackTrace();
    }
%>
	

	
</table>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
</body>
</html>