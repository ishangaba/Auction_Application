<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sales Report - Best Selling Items</title>
</head>
<body>
	<!-- Default header to be used across all non-authenticated pages -->
	<div style="float: right;">
	<form style="display: inline;" method="post" action="AdminPage.jsp"><input type="submit" value="Back"></form>
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
			Statement stmt2 = con.createStatement();

			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "SELECT Make, Model, Category, COUNT(*) AS NumBuy FROM Vehicle_Posts LEFT JOIN Bids USING (Vin_Number) WHERE Is_Winner = true GROUP BY Category, Make, Model ORDER BY NumBuy DESC";

			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			int count = 1;

			
		//<!--  Make an HTML table to show the results in: -->
		out.print("<table>");
		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		out.print("<h4>");
		//print out column header
		out.print("Best-Selling Items (Top 3 Items in Descending Order if Exist)");
		out.print("</h4>");
		out.print("</td>");
		out.print("</tr>");

			//parse out the results
			while (result.next() && count < 4) {
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar or beer name:
				out.print(count + "Vehicle Name:" + result.getString("Make") + ", " + result.getString("Model") + " (" + result.getString("Category") + ")");
				out.print("</td>");
				out.print("</tr>");
				count++;
			}
		
			//close the connection.
			out.print("</table>");
			db.closeConnection(con);

			
		} catch (Exception e) {
			out.print("No Completed Transcation Yet!");
		}%>

</body>
</html>