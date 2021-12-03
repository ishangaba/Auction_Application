<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>BuyMe - Login</title>
	</head>
	
	<body>

		<h1>Log-in </h1>

	<br>
		<form method="get" action="Login-Back.jsp">
			<table>
				<tr>    
					<td>Username:</td><td><input type="text" name="username" required></td>
				</tr>
				<tr>
					<td>Password:</td><td><input type="password" name="password" required></td>
				</tr>
			</table>
			Log-in as 
			<select name="Login_Type" size=1 required>
				<option value="admin">Admin</option>
				<option value="customer_representative">Customer Representative</option>
				<option value="user">User</option>
			</select>
			<input type="submit" value="Login">
		</form>
	<br>
	
	<br>
		New User?
		<form method="post" action="createNewUser-Front.jsp">
		<input type="submit" value="Create An Account">
		</form>
	<br>

</body>
</html>