<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Billing Info</title>
</head>
<body>
	<!-- Default header to be used across all non-authenticated pages -->
	<div style="float: right;">
	<form style="display: inline;" method="post" action="EditUser.jsp"><input type="submit" value="Back"></form>
	</div>
	<div style="clear: both;"></div>
	<hr/>
	<!-- End Header -->
	<form method="post" action="EditBillingInfoBack.jsp">
	<br><h4>Billing_Info</h4>
		<table>
			<td>First Name:</td><td><input type="text" name="firstname" required></td>
			<td>Last Name:</td><td><input type="text" name="lastname" required></td>
			<td>Street Address:</td><td><input type="text" name="street_address" required></td>
			<td>City:</td><td><input type="text" name="city" required></td>
			<td>State:</td><td><input type="text" name="state" required></td>
			<td>Zip:</td><td><input type="number" name="zip" required></td>
		</table>
	
		<input type="submit" value="Change">
	</form>
</body>
</html>