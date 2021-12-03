<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<!-- Default header to be used across all non-authenticated pages -->
	<div style="float: right;">
	<form style="display: inline;" method="post" action="AdminPage.jsp"><input type="submit" value="Back"></form>
	</div>
	<div style="clear: both;"></div>
	<hr/>
	<!-- End Header -->
	<%
		try {
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection connect = db.getConnection();
	
			//Create a SQL statement
			Statement stmt = connect.createStatement();

			String Username = request.getParameter("username");
			String Password = request.getParameter("password");
			String Name = request.getParameter("name");



			//Make an insert statement for the Sells table:
			String insert = "INSERT INTO customer_rep(Username, Password, Name, Employee_ID)"
					+ "VALUES (?, ?, ?, ?)";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = connect.prepareStatement(insert);
	
			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, Username);
			ps.setString(2, Password);
			ps.setString(3, Name);
			ps.setString(4, "1");
			
			ps.executeUpdate();
	
			connect.close();
			out.print("New Customer Rep. Created!");
			
		} catch (Exception ex) {
			out.print("Creation Failed, given username already exist!");
		}
%>
</body>
</html>