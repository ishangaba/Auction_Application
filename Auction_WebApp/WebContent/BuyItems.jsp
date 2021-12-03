<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*,java.time.*,java.util.Date"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Buy Items</title>
</head>
<body>
	
	<div style="float: left;">
			<form style="display: inline;" method="post" action="UserPage.jsp"><input type="submit" value="Back"></form>
			<form style="display: inline;" method="post" action="Logout.jsp"><input type="submit" value="Logout"></form>
		</div>
		<div style="clear: both;"></div>
		</hr>
	
	<h3>Buy Items</h3>
	<h5>List of Current Auctioning Items: </h5>
	<table border="1" id = "AuctionItems">
				<!-- Buying Options Under Buying Page! Please Navigate using the button at the top of the screen -->
				<tr>
				<th>Vin_Number</th>
				<th>Make</th>
				<th>Model</th>
				<th>Model Year</th>
				<th>Category</th>
				<th>Highest_Bid</th>
				<th>Close_Date_Time</th>
				</tr>
			<%
			try{//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection connect = db.getConnection();
	
			//Create a SQL statement
			Statement stmt = connect.createStatement();
			String sqlStmnt = "select vp.Vin_Number, vp.Make, vp.Model, vp.Model_Year, vp.Category, aStart.Close_Date_Time, aStart.Highest_Bid from  Vehicle_Posts as vp, Auction_Start as aStart where vp.Vin_Number = aStart.Vin_Number Order by Vin_Number" ;;
			
			
			ResultSet resultSet = stmt.executeQuery(sqlStmnt);
			while(resultSet.next()){
				%>
				<tr>
				<td><%=resultSet.getString("vp.Vin_Number") %></td>
				<td><%=resultSet.getString("vp.Make") %></td>
				<td><%=resultSet.getString("vp.Model") %></td>
				<td><%=resultSet.getString("vp.Model_Year") %></td>			
				<td><%=resultSet.getString("vp.Category") %></td>
				<td><%=resultSet.getString("aStart.Highest_Bid") %></td>
				<td><%=resultSet.getString("aStart.Close_Date_Time") %></td>
				</tr>
				<%	}
			
			}
			catch (Exception ex) {
				out.println("***" + ex.getMessage() + "***");
				out.println("Retrieve Failed");
				}
			%>
	</table>
	
	
	<h3>Please Enter Vehicle Information.</h3>
	
	<h5>VIN Number, current bid, and upper limit are required.</h5>
	<h5>Every time someone bids higher than your current bid, the computer automatically puts in a higher bid for you, till your upper limit is reached.</h5>
	<h5> If someone bids past your upper limit, BuyMe will alert you.</h5>

	
	
	
	<form method="get" action="BuyItemsBack.jsp" onSubmit= "checkValues()">
			<table>
				<tr>    
					<td>Vin Number:</td><td><input type="number" name="Vin_Number" required></td>
				</tr>
				<tr>
					<td>Set a current bid:</td><td><input type="number" id ="MinValue name="Current_Bid"></td>
				</tr>
				<tr>
					<td>Set your secret upper limit for this auction:</td><td><input type="number" id = "MaxValue" name="Upper_Limit" required></td>
								
				</tr>
				<tr>
					<td>Set your increment for this auction:</td><td><input type="number" name="Increment"></td>				
				</tr>
			</table>
			
			Submit your bidding!
			<input type="submit" value="Submit" >
			
		</form>
		
</body>
</html>