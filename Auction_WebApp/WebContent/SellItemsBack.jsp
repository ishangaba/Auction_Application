<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*,java.time.*,java.util.Date"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Selling Items</title>
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

			String vin = request.getParameter("Vin_Number");
			int Vin_Number = Integer.valueOf(vin);
			session.setAttribute("Vin_Number", Vin_Number);
			
			//String Username = request.getParameter("Username");
			String Category = request.getParameter("Category");
			
			String Username = (String)session.getAttribute("USERNAME");
			String Seller_Username = (String)session.getAttribute("USERNAME");
			String Accident_History = request.getParameter("Accident_History");
			String mileage = request.getParameter("Mileage");
			int Mileage;
			if(mileage.compareTo("") == 0) {
				Mileage = 0;
			}
			else {
				Mileage = Integer.valueOf(mileage);	
			}
			String Make = request.getParameter("Make");
			String Type = request.getParameter("Type");
			String year = request.getParameter("Model_Year");
			int Model_Year;
			
			//if the year field not filled out then default is 2021. 
			if(year.compareTo("") == 0) {
				Model_Year = 2021;
			}
			else {
				Model_Year = Integer.valueOf(year);
				if(Model_Year < 1885) {
					Model_Year = 1885;
				}
				if(Model_Year > 2021) {
					Model_Year = 2021;
				}
				
			}
			String Model = request.getParameter("Model");
			
			System.out.println("Some stuff here like " + Vin_Number + "(vin)");
			
			//Vehicle -> Vin, Category, Username, Accident, Mileage, Make, Model_year, Model
			
			//Make an insert statement for the Sells table:
			String insertVehicle = "INSERT INTO VEHICLE_POSTS(Vin_Number, Category, Username, Accident_History, Mileage, Make, Model_Year, Model)"
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = connect.prepareStatement(insertVehicle);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			
			//*********
			ps.setInt(1, Vin_Number);
			//*********
			ps.setString(2, Category);
			ps.setString(3, Username);
			//*********
			ps.setString(4, Accident_History);
			ps.setInt(5, Mileage);
			ps.setString(6, Make);
			ps.setInt(7, Model_Year);
			ps.setString(8, Model);
			
			System.out.println(ps);
			
			ps.executeUpdate();
			
			String dateTime = request.getParameter("Close_Date_Time");
			//java.sql.Date date = new java.sql.Date(dateTime);
			
			//DateTimeFormatter df = DateTimeFormatter.ofPattern("MM-yyyy");
			//DateTimeFormatter formatter = DateTimeFormatter.BASIC_ISO_DATE;

			//LocalDate Close_Date_Time = LocalDate.parse(dateTime, formatter);
			
			SimpleDateFormat s = new SimpleDateFormat("MM-dd-yyyy");
			java.util.Date date = s.parse(dateTime);
			long ms = date.getTime();
			java.sql.Date Close_Date_Time = new java.sql.Date(ms);
			
			
			
			String mbid = request.getParameter("Min_Price");
			System.out.println(mbid);
			float Min_Price = Float.valueOf(mbid);
			
			String increment = request.getParameter("Increment");
			System.out.println(increment);
			float Increment = Float.valueOf(increment);
			
			//Create the auction right here. 
			
			String ip = request.getParameter("Initial_Price");
			float Initial_Price = Float.valueOf(ip); 
			System.out.println(ip);
			System.out.println("I am here");
			
			//Vin_Number, Seller_Username, Close_Date_Time, Highest_Bid, Initial_Price, Mini_Price, Success, Category
			String insertAuc = "INSERT INTO Auction_Start(Vin_Number, Seller_Username, Close_Date_Time, Highest_Bid, Initial_Price, Min_Price, Increment, Success, Category)"
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement aucps = connect.prepareStatement(insertAuc);
			aucps.setInt(1, Vin_Number);
			//System.out.println(aucps); //prints
			aucps.setString(2, Username);
			
			aucps.setObject(3, Close_Date_Time);
			
			aucps.setFloat(4, 0);
			aucps.setFloat(5, Initial_Price);
			aucps.setFloat(6, Min_Price);
			aucps.setFloat(7, Increment);
			aucps.setBoolean(8, false);
			aucps.setString(9, Category);
			System.out.println("Final Auction Query->"+aucps); 
			aucps.executeUpdate();

			connect.close();
			out.print("Vehicle added to Database AND Auction");
			System.out.print("Vehicle added to Database AND Auction");
			
			if(Category.equals("Car")) {
				response.sendRedirect("CarPost.jsp");

			}
			else if(Category.equals("Truck")) {
				response.sendRedirect("TruckPost.jsp");
			}
			else {
				//Bus
				response.sendRedirect("BusPost.jsp");
			}
			
			/* Auction */
			
			
			
			
			
			
		} catch (Exception ex) {
			out.println("***" + ex.getMessage() + "***");
			out.println("Creation Failed");
		}
%>
</body>
</html>