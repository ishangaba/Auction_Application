<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*,java.time.*,java.util.Date"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Browse Trucks</title>
<hr/>
</head>
<body>
	<div style="float: left;">
				<form style="display: inline;" method="post" action="UserPage.jsp"><input type="submit" value="Home"></form>	
				<form style="display: inline;" method="post" action="Browse.jsp"><input type="submit" value="Back"></form>				
				<form style="display: inline;" method="post" action="SellItems.jsp"><input type="submit" value="SellItems"></form>
				<form style="display: inline;" method="post" action="BuyItems.jsp"><input type="submit" value="BuyItems"></form>
				<form style="display: inline;" method="post" action="BidHistory.jsp"><input type="submit" value="Look Up Bid History"></form>
	</div>
	<div style="float: Right;">
					<form style="display: inline;" method="post" action="Logout.jsp"><input type="submit" value="Logout"></form>
	</div>
			<div style="clear: both;"></div>
			<hr/>

	<h1> Browse Auction For Trucks</h1>
	<h2> Filter By</h2>
	
	
	<form method="get" action="BrowseBus.jsp">
			Display All Items
			<select name="All" size=1>
				<option value=""></option>
				<option value="*">All Selling Items</option>
			</select><br><br>
			Vehicle Type: 
			<select name="Category" size=1>
				
				<option value="Truck">Truck</option>
			</select><br><br>
			Make: 
			<select name="Make" size=1 required>
				
				<option value="Honda">Honda</option>
				<option value="Toyota">Toyota</option>
				<option value="Jaguar">Jaguar</option>
				<option value="Volvo">Volvo</option>
  				<option value="Saab">Saab</option>
  				<option value="Opel">Opel</option>
  				<option value="Audi">Audi</option>
  				<option value="Buick">Buick</option>
  				<option value="Cadillac">Cadillac</option>
  				<option value="Ford">Ford</option>
  				<option value="Ferrari">Ferrari</option>
  				<option value="GMC">GMC</option>  				
			</select><br><br>
			Year: <input type="number" name="Model_Year" value =2021 required></input>
			<input type="submit" value="Submit">
			
	</form>
	
	
	
	<!-- Default header to be used across all non-authenticated pages -->
	<div style="float: right;">
	<form style="display: inline;" method="post" action="BrowseBus.jsp"><input type="submit" value="Back"></form>
	</div>
	<div style="clear: both;"></div>
	<hr/>
	<h4>Buying Options Under Buying Page! Please Navigate using the button at the top of the screen.</h4>
	Search the List Towing Capacity: <input type="text" size="25" id="myInput" onkeyup="myFunction()" placeholder="Search by Towing Capacity" title="Type in search">
	<p>Refresh the Page for New Search and Display all Items!<p>
	<table border="1" id = "AuctionItems">
				<!-- Buying Options Under Buying Page! Please Navigate using the button at the top of the screen -->
				<tr>
				<th>Vin_Number</th>
				<th>Make</th>
				<th>Model</th>
				<th>Model Year</th>
				<th>Category</th>
				<th>Towing Capacity</th>
				<th>Highest_Bid</th>
				<th>Close_Date_Time</th>
				</tr>

		<%
			try{
				//Get the database connection
				ApplicationDB db = new ApplicationDB();	
				Connection connect = db.getConnection();
		
				//Create a SQL statement
				Statement stmt = connect.createStatement();
				
				//Get Parameters
				String All = request.getParameter("All");
				String Category = request.getParameter("Category");
				String Make = request.getParameter("Make");
				String year = request.getParameter("Model_Year");
				
				
				String sqlStmnt = "";
				
				if(All == "")
				{	
					sqlStmnt = "select vp.Vin_Number, vp.Make, vp.Model, vp.Model_Year, vp.Category,  tp.Towing_Capacity, aStart.Close_Date_Time, aStart.Highest_Bid from Truck_Posts as tp, Vehicle_Posts as vp, Auction_Start as aStart where " + "vp.Make = \""+ Make +"\"" +" and "+ "vp.Model_year = \" "+ year +"\"" + " and " + "vp.Vin_Number = aStart.Vin_Number and tp.Vin_Number = aStart.Vin_Number Order by Vin_Number" ;
					
				}
				else
				{
					sqlStmnt = "select vp.Vin_Number, vp.Make, vp.Model, vp.Model_Year, vp.Category, tp.Towing_Capacity, aStart.Close_Date_Time, aStart.Highest_Bid from Truck_Posts as tp, Vehicle_Posts as vp, Auction_Start as aStart where vp.Vin_Number = aStart.Vin_Number and tp.Vin_Number = aStart.Vin_Number Order by Vin_Number" ;				

				}
				//select cp.Vin_Number, cp.make, cp.Model, cp.Model_Year, cp.Type, a.Close_Date_Time, a.Highest_Bid
				//from Car_Posts as cp, Auction_Start as a 
				//where cp.Vin_Number = a.Vin_Number
				//Order by Vin_Number;
				ResultSet resultSet = stmt.executeQuery(sqlStmnt);
				if (resultSet == null)
				{ %>
					<tr><td> No Matches Found</td></tr>
				<% }
				else{					
						if (All == ""){
						out.println("Displaying Selection: \n" 
									+"Vehicle Category: " +Category + "\n"
									+"Make: " + Make + "\n" 
									+"Year: " + year); %> <br><br> <% 
						out.println("***If Nothing is Displayed Below: No Matches Found with Given Criteria***");}
						else
							{
							out.println("Displaying Selection: All Auctioning Items");
							}
					
				while(resultSet.next()){
				%>
				<tr>
				<td><%=resultSet.getString("vp.Vin_Number") %></td>
				<td><%=resultSet.getString("vp.Make") %></td>
				<td><%=resultSet.getString("vp.Model") %></td>
				<td><%=resultSet.getString("vp.Model_Year") %></td>			
				<td><%=resultSet.getString("vp.Category") %></td>
				<td><%=resultSet.getString("tp.Towing_Capacity") %></td>			
				<td><%=resultSet.getString("aStart.Highest_Bid") %></td>
				<td><%=resultSet.getString("aStart.Close_Date_Time") %></td>
				</tr>
				<%	}				
			} 
				connect.close();
			}
			catch (Exception ex) {
			out.println("***" + ex.getMessage() + "***");
			out.println("Retrieve Failed");
			}
		%>
		</table>
		
		<script>
		function myFunction() {
			  // Declare variables
			  var input, filter, table, tr, td, i;
			  input = document.getElementById("myInput");
			 
			  filter = input.value.toUpperCase();
			
			  table = document.getElementById("AuctionItems");
			  tr = table.getElementsByTagName("tr");
			  for (i = 0; i < tr.length; i++) {
				    td = tr[i].getElementsByTagName("td")[5]; // for column one
				    
				/* ADD columns here that you want you to filter to be used on */
				    if (td){ 
				    	
				      		if ( (td.innerHTML.toUpperCase().indexOf(filter) > -1) )  {            
				        		tr[i].style.display = "";
				      			} else {
				        		tr[i].style.display = "none";
				      			}
				    			
				  			}
			  }
	
		}		
		</script>

</body>
</html>