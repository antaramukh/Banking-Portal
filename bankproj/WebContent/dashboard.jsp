<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
 background-color: #9fa4c4;
background-image: linear-gradient(315deg, #9fa4c4 0%, #9e768f 74%);
 font-family: 'Poppins', sans-serif;
 color:#282828"
}
h1{
text-align:center; 
font-size: 45px; 
border:1px solid white; 
font-weight:100; 
PADDING:20Px;
text-transform: uppercase;
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
<meta charset="ISO-8859-1">
<title>Customer Dashboard</title>
</head>
<body>
<p style="visibility: hidden;">user = new User();</p>
<h1>DASHBOARD FOR Account id: ${user.bid} </h1>
<table align="center">
<tr> 
<ul>
<td><a href="custdetails.jsp" style=" padding: 10px 50px;">ACCOUNT DETAILS</a></td>
<td><a href="custhistory.jsp"style="padding: 10px 30px;">TRANSACTION HISTORY</a></td>
<td><a href="./custlogout"style="padding: 10px 90px;"> Logout</a></td>
</ul>
</tr>
</table>
<table align="center" style="padding:10px;">
<tr> 
<ul>
<td><a href="transfer.jsp" style=" padding: 10px 85px;"> TRANSFER</a></td>
<td><a href="deposit.jsp" style="padding: 10px 90px;">DEPOSIT</a></td>
<td><a href="withdraw.jsp"style="padding: 10px 90px;">WITHDRAW</a></td>
</tr>
</ul>
</table>
<br> <br> <br> <br> <br> <br> <br> <br>
</body>
</html>