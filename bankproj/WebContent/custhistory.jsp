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
<meta charset="ISO-8859-1">
<title>Transactions</title>
</head>
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
 <jsp:include page="custheader.jsp"></jsp:include> 

 <h1>Transactions History</h1>
  <p style="visibility: hidden;">user = new User(); </p>

  
<form method="post">

<table align="center">
<tr>
<td><b>TRANSACTION ID</b></td>
<td><b>AMOUNT</b></td>
<td><b>DATE & TIME</b></td>
<td><b>TRANSACTION TYPE</b></td>
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


String query="SELECT * FROM `bankproj`.`transaction`";
Connection conn=DriverManager.getConnection(url,username,password);
Statement stmt=conn.createStatement();
PreparedStatement statement = conn.prepareStatement(query);
ResultSet rs=stmt.executeQuery(query);




while(rs.next())
{
	if(rs.getInt("account_id_to")!=0){
		
		
		if(rs.getInt("account_id_to")==i){
		%>
			   <tr>
			    <td><%=rs.getInt("transaction_id") %></td>
			    <td>Rs. <%=rs.getString("transaction_amount") %></td>
			    <td><%=rs.getString("transaction_time") %></td>
			    <td>Received From Account ID: <%=rs.getInt("customer_id_by") %> </td> 
			</tr>
		<%
			}
		else if(rs.getInt("customer_id_by")==i){

		%>
   		<tr>
    		<td><%=rs.getInt("transaction_id") %></td>
    		<td>Rs. <%=rs.getString("transaction_amount") %></td>
    		<td><%=rs.getString("transaction_time") %></td>
    		<td>Sent to Account ID: <%=rs.getInt("account_id_to") %> </td> 
		</tr>
        <%
}}

	else if(rs.getInt("customer_id_by")==i && rs.getInt("account_id_to")==0)
{
	

%>
<tr>
    <td><%=rs.getInt("transaction_id") %></td>
    <td>Rs. <%=rs.getString("transaction_amount") %></td>
    <td><%=rs.getString("transaction_time") %></td>
    <td><%=rs.getString("transaction_type")%> </td>
</tr>
<%

}}
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