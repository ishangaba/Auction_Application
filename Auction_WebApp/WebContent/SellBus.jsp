<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*,java.time.*,java.util.Date"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Selling Bus</title>
</head>
<body>
	<!-- Default header to be used across all non-authenticated pages -->
	<div style="float: right;">
	<form style="display: inline;" method="post" action="SellItems.jsp"><input type="submit" value="Back"></form>
	</div>
	<div style="clear: both;"></div>
	<hr/>
	<%
		try {		
			//Get the database connection			
			ApplicationDB db = new ApplicationDB();	
			Connection connect = db.getConnection();
	
			//Create a SQL statement
			Statement stmt = connect.createStatement();
			//Vehicle -> Vin, Category, Username, Accident, Mileage, Make, Model_year, Model
			//Auction -> Vin_Number, Seller_Username, Close_Date_Time, Highest_Bid, Initial_Price, Mini_Price, Success, Type

			//Vin, Type and Door
			String Vin = String.valueOf(session.getAttribute("Vin_Number"));
			
			int Vin_Number = Integer.valueOf(Vin);
			String Size = request.getParameter("Size");
			int Capacity = Integer.parseInt(request.getParameter("Capacity"));
			System.out.println("Some stuff here like " + Vin_Number + "(vin)");
			
			String insertVehicle = "INSERT INTO BUS_POSTS(Vin_Number, Size, Capacity)"
					+ "VALUES (?, ?, ?)";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = connect.prepareStatement(insertVehicle);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			
			//*********
			ps.setInt(1, Vin_Number);
			ps.setString(2, Size);
			ps.setInt(3, Capacity);
			
			System.out.println(ps);
			
			ps.executeUpdate();
			
			
			connect.close();
			out.print("Bus added to Database");
			
		} catch (Exception ex) {
			out.println("***" + ex.getMessage() + "***");
			out.println("Creation Failed");
		}
%>
</body>
</html>