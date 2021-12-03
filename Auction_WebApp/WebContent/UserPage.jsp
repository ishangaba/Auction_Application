<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BuyMe - User</title>
</head>
<body>
	<!-- Default header to be used across all non-authenticated pages -->
		<div style="float: right;">
			<form style="display: inline;" method="post" action="Logout.jsp"><input type="submit" value="Logout"></form>
		</div>
		<div style="clear: both;"></div>
		<hr/>
	<!-- End Header -->
	<h3>User Page</h3>
	
	<h3>Are you buying or selling items?</h3>
	
	<br>
		Buying Items?
		<form method="post" action="BuyItems.jsp">
		<input type="submit" value="Buy Items">
		</form>
	<br>
	<br>
		Selling Items?
		<form method="post" action="SellItems.jsp">
		<input type="submit" value="Sell Items">
		</form>
	<br>
	<br>
		Browse Items?
		<form method="post" action="Browse.jsp">
		<input  type="submit" value="Browse Everything">
		</form>
		<form method="post" action="BrowseCar.jsp">
		<input type="submit" value="Browse Cars">
		</form>
		<form method="post" action="BrowseBus.jsp">
		<input type="submit" value="Browse Buses">
		</form>
		<form method="post" action="BrowseTruck.jsp">
		<input type="submit" value="Browse Trucks">
		</form>
	<br>
	<br>
		Last Month Auctions Detials
		<form method="post" action="LastMonthAuction.jsp">
		<input  type="submit" value="Last Month's Similar Auctions">
		</form>
	
</body>
</html>