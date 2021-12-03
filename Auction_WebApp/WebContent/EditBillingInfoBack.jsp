<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Billing Info</title>
</head>
<body>
	<!-- Default header to be used across all non-authenticated pages -->
	<div style="float: right;">
	<form style="display: inline;" method="post" action="EditUser.jsp"><input type="submit" value="Back"></form>
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
			
			String First = request.getParameter("firstname");
			String Last = request.getParameter("lastname");
			String Street = request.getParameter("street_address");
			String City = request.getParameter("city");
			String State = request.getParameter("state");
			String Zip = request.getParameter("zip");	
			String Billing_info = First + " " + Last + " , " + Street + "," + City + "," + State + " " + Zip;


			//Make an insert statement for the Sells table:
			String update = "UPDATE User SET Billing_Info = '" + Billing_info + "' WHERE Username = '" + session.getAttribute("Modify User") + "'";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = connect.prepareStatement(update);
	
			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			
			ps.executeUpdate();
	
			connect.close();
			out.print("Billing Info Changed!");
			
		} catch (Exception ex) {
			out.print("Oops! Something Went Wrong!");
		}
%>
</body>
</html>