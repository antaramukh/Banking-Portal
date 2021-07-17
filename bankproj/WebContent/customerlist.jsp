<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
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
<title>Customer List</title>
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
PADDING:20PX;
text-transform: uppercase;
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
<body>
<jsp:include page="adminheader.jsp"></jsp:include> 
 <h1>Customer List</h1>
  <p style="visibility: hidden;">user = new User(); </p>

  
<form method="post">

<table align="center">
<tr>
<td>ACCOUNT NO.</td>
<td>CUSTOMER NAME</td>
<td>ADDRESS</td>
<td>GENDER</td>
<td>PHONE</td>
<td>EMAIL</td>
<td>BALANCE</td>
<td>BANK NAME</td>
</tr>
<%




try
{

Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/bankproj";
String username="root";
String password="J$esus123";
String query="SELECT c.*,bname.name FROM `bankproj`.`customer` c ,`bankproj`.`bank_branch` bname  where c.bank_branch_id =bname.bank_branch_id";

Connection conn=DriverManager.getConnection(url,username,password);
Statement stmt=conn.createStatement();
PreparedStatement statement = conn.prepareStatement(query);

ResultSet rs=stmt.executeQuery(query);




while(rs.next())
{

%>
   <tr>
    <td><%=rs.getInt("customer_id") %></td>
   
    <td><%=rs.getString("cname") %></td>
    <td><%=rs.getString("address") %></td>
    <td><%=rs.getString("gender") %></td>
    <td><%=rs.getString("phone") %></td>
    <td><%=rs.getString("email") %></td>
    <td>Rs. <%=rs.getInt("amount") %></td>
    <td><%=rs.getString("name") %></td>
    
    
    
   
</tr>
        <%

}
%>
    </table>
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

</form>
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