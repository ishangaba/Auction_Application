<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*,java.time.*,java.util.Date"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Buy Items</title>
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
			
			//check number of bids on vehicle
			
			
			
			//Vin_Number, Category, Current_Bid, Upper_Limit 

			String vin = request.getParameter("Vin_Number");
			int Vin_Number = Integer.valueOf(vin);
			session.setAttribute("Vin_Number", Vin_Number);
			
			//select count(*) from Bids where Vin_Number=44;
			
			String insertBid = "INSERT INTO Bids(Buyer_Username, Vin_Number, Is_Winner, Upper_Limit, Current_Bid, Increment)"
					+ "VALUES (?, ?, ?, ?, ?, ?)";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = connect.prepareStatement(insertBid);

			
			String bid = request.getParameter("Current_Bid");
			float Current_Bid = Float.valueOf(bid);
			
			String ubid = request.getParameter("Upper_Limit");
			float Upper_Limit = Float.valueOf(ubid);
			
			String Buyer_Username = (String)session.getAttribute("USERNAME");
			
			
			String increment = request.getParameter("Increment");
			float Increment = Float.valueOf(increment);
			
			System.out.println("Some stuff here like " + Buyer_Username + "(Buyer_Username)");
			
			//Vin_Number, Category, Current_Bid, Upper_Limit
			/*
			Buyer_Username varchar(50) ,
  Vin_Number int,
  Is_Winner boolean DEFAULT FALSE,
  Upper_Limit float DEFAULT NULL,
  Current_Bid float,
  Increment float,
  */
	
  			//select count(*) from Bids where Vin_Number=44;
  
			String count = "select count(*) from Bids where Vin_Number=" + Vin_Number;
			PreparedStatement c = connect.prepareStatement(count);
			
			int bids = c.executeUpdate();
			
			//if 0 bids, then make this bid the highest_bid
			//else
				//if smaller than current bid, then not added to the db, instead alert them
				//we make this bid the highest_bid
			
			if(bids == 0) {
				PreparedStatement ps = connect.prepareStatement(insertBid);

				//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
				
				//*********
				ps.setString(1, Buyer_Username);
				ps.setInt(2, Vin_Number);
				//*********
				ps.setBoolean(3, false);
				ps.setFloat(4, Upper_Limit);
				ps.setFloat(5, Current_Bid);
				ps.setFloat(6, Increment);
				System.out.println(ps);
				
				ps.executeUpdate();
				connect.close();
				
				out.print("Bid added to DB");
				System.out.print("Bid added to DB");
				
			}
			else {
				//higher than highest bid here
			}

			
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			
			
			
			
			
		} catch (Exception ex) {
			out.println("***" + ex.getMessage() + "***");
			out.println("Bid Creation Failed");
		}
%>
</body>
</html>