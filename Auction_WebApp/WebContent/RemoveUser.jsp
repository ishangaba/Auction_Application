<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Remove User</title>
</head>
<body>
	<!-- Default header to be used across all non-authenticated pages -->
	<div style="float: right;">
	<form style="display: inline;" method="post" action="CustomerRepPage.jsp"><input type="submit" value="Back"></form>
	</div>
	<div style="clear: both;"></div>
	<hr/>
	<!-- End Header -->
	<% try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();

			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "SELECT * FROM User";

			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
		%>
			
		<!--  Make an HTML table to show the results in: -->
	<table cellspacing="10" cellpadding="5">
		<tr>    
			<td><h4>List of Users</h4></td>
		</tr>
		<tr>  
			<td> Username </td>
			<!-- There will be a 5px space here -->
			<td> Password </td>
			<!-- There will be a 5px space here -->
			<td> Email </td>
			<!-- There will be a 5px space here -->
			<td> Transaction Method </td>
			<!-- There will be a 5px space here -->
			<td> Billing Info </td>
			<!-- There will be a 5px space here -->
		</tr>
		
				<%
			//parse out the results
			while (result.next()) { %>
				<tr>    
					<td><%= result.getString("Username") %></td>
					<!-- There will be a 5px space here -->
					<td><%= result.getString("Password") %></td>
					<!-- There will be a 5px space here -->
					<td><%= result.getString("Email") %></td>
					<!-- There will be a 5px space here -->
					<td><%= result.getString("Transaction_method") %></td>
					<!-- There will be a 5px space here -->
					<td><%= result.getString("Billing_Info") %></td>
					<!-- There will be a 5px space here -->
				</tr>
			<% }
		
			//close the connection.
			db.closeConnection(con);
			%>
		</table>
		<br>
		<br>
		<form method="post" action="RemoveUserBack.jsp">
		<table>
			<tr>
				<td>User to Remove:</td><td><input type="text" name="user" required> <input type="submit" value="Remove"> </td>
			</tr>
		</table>
	</form>
			
		<%} catch (Exception e) {
			out.print("Error");
		}%>

</body>
</html>