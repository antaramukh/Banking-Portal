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
<a href="" class="logo" >Your Bank</a>
<div class="header-right">
<a class="active" href="dashboard.jsp">Home</a>
<a href="custdetails.jsp">Details</a>
<a href="transfer.jsp">Transfer</a>
<a href="deposit.jsp">Deposit</a>
<a href="withdraw.jsp">Withdraw</a>
<a href="custhistory.jsp">Transactions</a>
<a href="./custlogout">Logout</a>
</div>
</div>