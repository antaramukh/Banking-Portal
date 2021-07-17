<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Login</title>
<style>
.header {
  overflow: hidden;

  padding: 20px 10px;
  font-family: 'Poppins', sans-serif;
}
.header a {
  float: left;
  text-align: center;
  padding: 5px;
  text-decoration: none;
  font-size: 18px;
  line-height: 25px;
  border-radius: 4px;
}
body{
 background-color: #7f5a83;
background-image: linear-gradient(315deg, #7f5a83 0%, #0d324d 74%);
font-family: 'Poppins', sans-serif; 
color: white;
}
h1{
text-align:center; 
font-size: 40px; 
border:1px solid white; 
font-weight:100; 
PADDING:20PX;
text-transform: uppercase;
}
a{
color: #fff; 
border: 1px solid white; 
padding: 10px 29px;
text-transform: uppercase;
width: 150px; 
text-decoration: none;
}
</style>
<div class="header">
<a href="homepage.jsp" class="logo" >Home Page</a>
</div>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
<h1>Customer Login</h1>
<form action="./CustLog" method="post">
<table align="center">
<tr> 
<td>Enter Username:</td>
<td style="padding:15px;"><input type="text" name="un1" required/></td>
</tr>
<tr> 
<td>Enter Password:</td>
<td style="padding:15px;"><input type="password" name="pass" required/></td>
</tr>
<tr>
<td colspan="2" align="center" style="padding:10px;"> <input type="submit" value="Login" 
style="background: none;color: #fff; padding: 10px 10px;text-transform: uppercase;width: 120px;"></td>
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
<a href=createacc.jsp> Do you want to create NEW ACCOUNT?</a>
</div>
<br> <br> <br> <br> <br> <br> <br><br>
</body>
</html>