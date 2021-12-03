<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BuyMe - Admin</title>
</head>
<body>
	<!-- Default header to be used across all non-authenticated pages -->
		<div style="float: right;">
			<form style="display: inline;" method="post" action="Logout.jsp"> <input type="submit" value="Logout"></form>
		</div>
		<div style="clear: both;"></div>
		<hr/>
	<!-- End Header -->
	<h2>Admin Page</h2>
	
	<h3>Creating New Customer Rep. Account</h3>
	<form method="post" action="createNewCustomerRep.jsp">
		<table>
			<tr>
				<td>Employee ID:</td><td><input type="text" name="ID" required></td>
			</tr>
			<tr>
				<td>Name:</td><td><input type="text" name="name" required></td>
			</tr>
			<tr>
				<td>Username:</td><td><input type="text" name="username" required></td>
			</tr>
			<tr>
				<td>Password:</td><td><input type="password" name="password" required></td>
			</tr>
		</table>
	
		<input type="submit" value="Create">
	</form>
	
	<h3>Sales Reports</h3>
	<h4>Total Earning reports</h4>
	<form style="display: inline;" method="get" action="TotalEarning.jsp"> <input type="submit" value="Generate"></form>
	<h4>Earnings Per</h4>
	<form method="get" action="EarningsPer.jsp">
			<select name="Type" size=1 required>
				<option value="Item">Item</option>
				<option value="Item_Type">Item Type</option>
				<option value="User">End-User</option>
			</select>
			<input type="submit" value="Generate">
	</form>
	<h4>Best Selling Item</h4> <form style="display: inline;" method="get" action="BestSellingItem.jsp"> <input type="submit" value="Generate"></form>
	<h4>Best Buyer</h4> <form style="display: inline;" method="get" action="BestBuyer.jsp"> <input type="submit" value="Generate"></form>
	
	
</body>
</html>