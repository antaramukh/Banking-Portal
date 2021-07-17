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
<title>Add Bank</title>
</head>
<style>

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
<jsp:include page="adminheader.jsp"></jsp:include> 
<h1>ADD BANK</h1>

<form action="AddBank" method="post">
<table align="center"">
<tr> 
<td>Enter Bank Name:</td>
<td style="padding:15px;"><input type="text" name="n1" required/></td>
</tr>
<tr> 
<td>Enter Bank Location:</td>
<td style="padding:15px;"><input type="text" name="loc" required/></td>
</tr>

<tr>
<td colspan="2" align="center" style="padding: 20px 20px 10px 10px;">
<input type="submit" value="ADD" 
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

</body>
</html>