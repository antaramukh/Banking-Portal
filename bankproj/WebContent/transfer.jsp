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
    // user is not logged in, do something about it
} else {
    // user IS logged in, do something: set model or do whatever you need
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Transfer</title>
</head>
<style>
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
   -webkit-appearance: none;
   margin: 0;
}
input[type="number"] {
   -moz-appearance: textfield;
}
body{
background: #DAE2F8; 
background: linear-gradient(to right, #D6A4A4, #DAE2F8); 
font-family: 'Poppins', sans-serif;
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
<body>
<jsp:include page="custheader.jsp"></jsp:include> 
<h1>Transfer</h1>
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
<p style="text-align:center; font-size: 20px; border:1px solid white; font-weight:100; PADDING:10PX;">Current Balance: Rs. <%=rs.getInt("amount") %> </p>
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

<form action="TransferAmt" method="post">
<table align="center">
<tr> 
<td>Enter Account No:</td>
<td style="padding:15px;"><input type="number" name="accn1" value="${user.bid}" readonly required/></td>
</tr>
<tr>
<td>Target Account No:</td>
<td style="padding:15px;"><input type="number" name="accn2" required/></td>
</tr>
<tr> 
<td>Enter PIN:</td>
<td style="padding:15px;"><input type="password" name="pin" required/></td>
</tr>
<tr> 
<td>Enter Amount:</td>
<td style="padding:15px;"><input type="number" name="amt" required/></td>
</tr>

<tr>
<td colspan="2" align="center" style="padding: 20px 20px 10px 10px;">
<input type="submit" value="TRANSFER" 
style="background: none;color: black; padding: 10px 20px;text-transform: uppercase;width: 235px;"></td>
</tr>

</table>
</form>
<table align="center">
<tr> 
<td align="center">${message}
</tr>
</table>
<br>
<br>
<br>
<br>
<br>
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