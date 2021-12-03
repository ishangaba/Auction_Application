<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*,java.time.*,java.util.Date"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bid History</title>
<hr/>
</head>
<body>
	<div style="float: left;">
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

	<h1> Browse Bid History Details</h1>
	<h2> Filter By</h2>
	
	
	<form method="get" action="BidHistory.jsp">
			Display All Items
			<select name="All" size=1>
				<option value=""></option>
				<option value="*">All Selling Items</option>
			</select><br><br>
			Vehicle Category: 
			<select name="Category" size=1>
				
				<option value="Car">Car</option>
				<option value="Truck">Truck</option>
				<option value="Bus">Bus</option>
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
			Vin-Number: <input padding=5px  Border = 1px type="number" name="Model_Year" required></input><br><br>
			Year: <input type="number" name="Model_Year" value =2021 required></input><br><br>
			Seller_Username: <input type="text" name="Seller_username"  ></input><br><br>
			Buyer_Username: <input type="text" name="Buyer_Username"  ></input>
			<input type="submit" value="Submit">
			
	</form>
	
	
	
	<!-- Default header to be used across all non-authenticated pages -->
	<div style="float: right;">
	<form style="display: inline;" method="post" action="BidHistory.jsp"><input type="submit" value="Back"></form>
	</div>
	<div style="clear: both;"></div>
	<hr/>
	<h4>Buying Options Under Buying Page! Please Navigate using the button at the top of the screen.</h4>
	Search the List Below: <input type="text" size="50" id="myInput" onkeyup="myFunction()" placeholder="Search by Vin, Make, Model, and type" title="Type in search"><br>
	<table border="1" id = "AuctionItems">
				<!-- Buying Options Under Buying Page! Please Navigate using the button at the top of the screen -->
				<tr>
				<th>Seller_Username</th>		
				<th>Buyer_Username</th>				
				<th>Vin_Number</th>
				<th>Category</th>
				<th>Make</th>
				<th>Model Year</th>
				<th>Current_Bid</th>
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
				String SellerName = request.getParameter("Seller_Username");
				String BuyerName = request.getParameter("Buyer_Username");
				String All = request.getParameter("All");
				String Category = request.getParameter("Category");
				String Make = request.getParameter("Make");
				String year = request.getParameter("Model_Year");
				
				
				String sqlStmnt = "";
				
				if(All == "")
				{	
						sqlStmnt = "SELECT b.Buyer_Username, vp.Username, b.Vin_Number, vp.Category, vp.Make, vp.Model_Year, b.Current_Bid, aStart.Highest_Bid, aStart.Close_Date_Time " + 
									"FROM Auction_Start as aStart, Bids as b, Vehicle_Posts as vp " + 
									"where  b.Buyer_Username = "+ BuyerName +  " and vp.Username = " + SellerName  + " and vp.Make = "+ Make +
									" and vp.Category = "+ Category +" and vp.Model_year = "+ year +" and b.Vin_Number = aStart.Vin_Number Order by b.Buyer_Username";

				}
				else
				{
						sqlStmnt = "SELECT b.Buyer_Username, vp.Username, b.Vin_Number, vp.Category, vp.Make, vp.Model_Year, b.Current_Bid, aStart.Highest_Bid, aStart.Close_Date_Time FROM Auction_Start as aStart, Bids as b, Vehicle_Posts as vp where b.Vin_Number = aStart.Vin_Number";
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
									+"Year: " + year + 
									"Seller Username: " + SellerName +
									"Buyer Username: "+ BuyerName);%> <br><br> <% 
						out.println("***If Nothing is Displayed Below: No Matches Found with Given Criteria***");}
						else
							{
							out.println("Displaying Selection: All Auctioning Items");
							}
					
				while(resultSet.next()){
					
				%>
				<tr>
				<td><%=resultSet.getString("vp.Username") %></td>
				<td><%=resultSet.getString("b.Buyer_Username") %></td>
				<td><%=resultSet.getString("vp.Vin_Number") %></td>
				<td><%=resultSet.getString("vp.Category") %></td>
				<td><%=resultSet.getString("vp.Make") %></td>
				<td><%=resultSet.getString("vp.Model_Year") %></td>			
				<td><%=resultSet.getString("b.Current_Bid") %></td>
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
		function myFunction() function myFunction() {
			  // Declare variables
			  var input, filter, table, tr, td, i, tds, txtValue;
			  input = document.getElementById("myInput");
			  filter = input.value.toUpperCase();
			  table = document.getElementById("AuctionItems");
			  tr = table.getElementsByTagName("tr");
			  for (i = 0; i < tr.length; i++) {
				    td = tr[i].getElementsByTagName("td")[0]; // for column one
				     td1 = tr[i].getElementsByTagName("td")[1]; // for column two
				     td2 = tr[i].getElementsByTagName("td")[2]; //for Column Three
				     td5 = tr[i].getElementsByTagName("td")[2]; //for Column five
				/* ADD columns here that you want you to filter to be used on */
				    if (td) {
				      if ( (td.innerHTML.toUpperCase().indexOf(filter) > -1) || (td1.innerHTML.toUpperCase().indexOf(filter) > -1) || (td2.innerHTML.toUpperCase().indexOf(filter) > -1)|| (td5.innerHTML.toUpperCase().indexOf(filter) > -1))  {            
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