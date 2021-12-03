<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*,java.time.*,java.util.Date"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Stuff</title>
</head>
<body>
	<!-- Default header to be used across all non-authenticated pages -->
	<div style="float: right;">
	<form style="display: inline;" method="post" action="AskCustomerRepQuestions.jsp"><input type="submit" value="Back"></form>
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
			
			//Username, Ticket_Number, Question, Answer, Customer_Rep

			//String vin = request.getParameter("Vin_Number");
			//int Vin_Number = Integer.valueOf(vin);
			String Username = (String)session.getAttribute("Username");
			String Question = request.getParameter("Question");
			
			System.out.println("Some stuff here like " + Username + "(username)");
			System.out.println("Some stuff here like *" + Question + "* (Question)");
			int Ticket_Number;
			
			//Making Ticket_Number, Answer and Customer_Rep null.

			//Make an insert statement for the Sells table:
			String insertCar = "INSERT INTO Answering_Questions(Username, Ticket_Number, Question, Answer, Customer_Rep)"
					+ "VALUES (?, ?, ?, ?, ?)";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = connect.prepareStatement(insertCar);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			/*
			//*********
			//ps.setInt(1, Vin_Number);
			//*********
			ps.setString(2, Username);
			//*********
			ps.setString(3, Accident_History);
			ps.setInt(4, Mileage);
			ps.setString(5, Make);
			ps.setInt(6, Model_Year);
			ps.setString(7, Model);
			ps.setString(8, Type);
			
			System.out.println(ps);
			
			ps.executeUpdate();
			
			//Create the auction right here. 
			
			
			String insertAuc = "INSERT INTO Auction_Start(Vin_Number, Seller_Username, Close_Date_Time, Highest_Bid, Type)"
					+ "VALUES (?, ?, ?, ?, ?)";
			PreparedStatement aucps = connect.prepareStatement(insertAuc);
			aucps.setInt(1, Vin_Number);
			System.out.println(aucps); //prints
			aucps.setString(2, Username);
			//System.out.println(aucps); //prints
			System.out.println(dateTime + " -> dateTime");
			//aucps.setDate(3, java.sql.Date.valueOf(dateTime));
			//aucps.setDate(3, java.sql.Date.valueOf(date));
			aucps.setObject(3, Close_Date_Time);
			System.out.println(aucps); //shit goes wrong about here
			aucps.setFloat(4, Highest_Bid);
			System.out.println(aucps); 
			aucps.setString(5, Type);
			
			System.out.println(aucps); 
			aucps.executeUpdate();
			*/
			connect.close();
			out.print("Car added to Database AND Auction!");
			
		} catch (Exception ex) {
			out.println("***" + ex.getMessage() + "***");
			out.println("Creation Failed");
		}
%>
</body>
</html>