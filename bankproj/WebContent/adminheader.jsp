<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    

    
<style>

.header {
  overflow: hidden;
  background-color: #f1f1f1;
  padding: 20px 10px;
  font-family: 'Poppins', sans-serif;
}

.header a {
  float: left;
  color: black;
  text-align: center;
  padding: 12px;
  text-decoration: none;
  font-size: 18px;
  line-height: 25px;
  border-radius: 4px;
}

.header a.logo {
  font-size: 25px;
  font-weight: bold;
  pointer-events: none;
}


.header a:hover {
  background-color: #ddd;
  color: black;
}

.header a.active {
  background: #252525;
color: #fff; 
}

.header-right {
  float: right;
}


    </style>
<div class="header">
  <a href="" class="logo" >Bank Management</a>
  <div class="header-right">
    <a class="active" href="addashboard.jsp">Home</a>
     <a href="addbank.jsp">Add Bank</a>
    <a href="banklist.jsp">Bank List</a>
    <a href="customerlist.jsp">Customer List</a>
    <a href="./adlogout">Logout</a>
  </div>
</div>