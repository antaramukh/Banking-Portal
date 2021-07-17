<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 
HttpSession session1 = request.getSession();
if (session1.getAttribute("aduser") == null) {
	response.sendRedirect("adminlogin.jsp");
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
<title>Admin Dashboard</title>
</head>

<style>

body{
 background-color: #9fa4c4;
background-image: linear-gradient(315deg, #9fa4c4 0%, #9e768f 74%);
 font-family: 'Poppins', sans-serif;
 color:#282828"
}
h1{
text-align:center; 
font-size: 50px; 
border:1px solid white; 
font-weight:100; 
PADDING:20Px;
}
table{
  padding:60px 10px 10px 10px;
  font-family: 'Poppins', sans-serif;
  
}
td {
  padding:30px;
  font-family: 'Poppins', sans-serif;
}
a{
text-transform: uppercase;
width: 130px;
text-decoration: none;
background: #252525;
color: #fff; 

}
</style>

<body>
 
<h1>ADMIN DASHBOARD</h1>

<table align="center">
<tr> 
<ul>
<td><a href="addbank.jsp" style="padding: 10px 90px;"> Add Bank</a></td>
<td><a href="banklist.jsp" style="padding: 10px 90px;">Bank List</a></td>
</ul>
</tr>
</table>

<table align="center" style="padding:10px;">
<tr> 
<ul>
<td><a href="customerlist.jsp" style="padding: 10px 70px;"> Customer List</a></td>
<td><a href="./adlogout" style="padding: 10px 95px;"> Logout</a></td>
</tr>
</ul>
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