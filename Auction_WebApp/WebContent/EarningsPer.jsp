<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sales Report - Earning Per</title>
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
			
			String type = request.getParameter("Type");
			
			String str;
			
			if (type.equals("item")){ str = "SELECT Vin_Number, Make, Model, Category, Current_Bid FROM Vehicle_Posts LEFT JOIN Bids USING (Vin_Number) WHERE Is_Winner = true GROUP BY Vin_Number"; }
			else if (type.equals("item_type")){ str = "SELECT Category, SUM(Current_Bid) AS Total FROM Vehicle_Posts LEFT JOIN Bids USING (Vin_Number) WHERE Is_Winner = true GROUP BY Category";}
			else {str = "SELECT Seller_Username, SUM(Highest_Bid) AS Total FROM Auction_Start WHERE Success = true GROUP BY Seller_Username";}

			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			
		//<!--  Make an HTML table to show the results in: -->
		out.print("<table>");
		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		out.print("<h4>");
		//print out column header
		out.print("Earning Per " + type);
		out.print("</h4>");
		out.print("</td>");
		out.print("</tr>");

			//parse out the results
			while (result.next()) {
				out.print("<tr>");
				//Print out current bar or beer name:
				if (type.equals("Item")) {
					out.print("<td>");
					out.print("Vin Number: ");
					out.print("</td>");
					out.print("<td>");
					out.print(result.getString("Vin_Number"));
					out.print("</td>");
					out.print("<td>");
					out.print("Make: ");
					out.print("</td>");
					out.print("<td>");
					out.print(result.getString("Make"));
					out.print("</td>");
					out.print("<td>");
					out.print("Model: ");
					out.print("</td>");
					out.print("<td>");
					out.print(result.getString("Model"));
					out.print("</td>");
					out.print("<td>");
					out.print("Category: ");
					out.print("</td>");
					out.print("<td>");
					out.print(result.getString("Category"));
					out.print("</td>");
					out.print("<td>");
					out.print("Earning: ");
					out.print("</td>");
					out.print("<td>");
					out.print(result.getString("Current_Bid"));
					out.print("</td>");
					
					//out.print("Vin Number: " + result.getString("Vin_Number") + ", Make: " + result.getString("Make") + ", Model: " + result.getString("Model") + ", Category: " + result.getString("Category") + ", Earning: " + result.getString("Current_Bid"));
				}
				else if (type.equals("Item_Type")) {
					out.print("<td>");
					out.print("Category: ");
					out.print("</td>");
					out.print("<td>");
					out.print(result.getString("Category"));
					out.print("</td>");
					out.print("<td>");
					out.print("Earning: ");
					out.print("</td>");
					out.print("<td>");
					out.print(result.getString("Total"));
					out.print("</td>");
				}
				else {
					out.print("<td>");
					out.print("User: ");
					out.print("</td>");
					out.print("<td>");
					out.print(result.getString("Seller_Username"));
					out.print("</td>");
					out.print("<td>");
					out.print("Earning: ");
					out.print("</td>");
					out.print("<td>");
					out.print(result.getString("Total"));
					out.print("</td>");
				}
				out.print("</tr>");
			}
		
			//close the connection.
			out.print("</table>");
			db.closeConnection(con);

			
		} catch (Exception e) {
			out.print("No Completed Transcation Yet!");
		}%>

</body>
</html>