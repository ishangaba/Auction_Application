<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*,java.time.*,java.util.Date"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Browse For All Items</title>
<hr/>
</head>
<body>
	<div style="float: left;">
				<form style="display: inline;" method="post" action="UserPage.jsp"><input type="submit" value="Back"></form>				
				<form style="display: inline;" method="post" action="SellItems.jsp"><input type="submit" value="SellItems"></form>
				<form style="display: inline;" method="post" action="BuyItems.jsp"><input type="submit" value="BuyItems"></form>
				<form style="display: inline;" method="post" action="BidHistory.jsp"><input type="submit" value="Look Up Bid History"></form>
	</div>
	<div style="float: Right;">
					<form style="display: inline;" method="post" action="Logout.jsp"><input type="submit" value="Logout"></form>
	</div>
			<div style="clear: both;"></div>
			<hr/>

	<h1> Browse Auction For All Items</h1>
	<h2> Filter By</h2>
	
	
	<!-- Default header to be used across all non-authenticated pages -->
	<div style="clear: both;"></div>
	<hr/>
	<h4>Buying Options Under Buying Page! Please Navigate using the button at the top of the screen.</h4>
	Search the List Vehicle Category: <input type="text" size="25" id="myInput" onkeyup="myFunction()" placeholder="Search by Category" title="Type in search">
	<p>Refresh the Page for New Search and Display all Items.<p>
	<table border="1" id = "AuctionItems">
				<!-- Buying Options Under Buying Page! Please Navigate using the button at the top of the screen -->
				<tr>
				<th>Vin_Number</th>
				<th>Seller Username</th>
				<th>category</th>
				<th>Close_Date_Time</th>
				<th>Highest_Bid</th>
				</tr>

		<%
			try{
				//Get the database connection
				ApplicationDB db = new ApplicationDB();	
				Connection connect = db.getConnection();
		
				//Create a SQL statement
				Statement stmt = connect.createStatement();
				
				//Get Parameters
				String Category = request.getParameter("Category");
			
				
				
				
				
				String sqlStmnt = "";
				
					sqlStmnt= "select astart.Vin_Number, astart.Seller_Username, aStart.Close_Date_Time, aStart.Category, aStart.Highest_bid  from Auction_Start as aStart where aStart.Category = \""+ Category +"\" and aStart.Close_Date_Time <= CURDATE() AND aStart.Close_Date_Time >= ( CURDATE() - 30)";
;
				
					System.out.println(sqlStmnt);				
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

					while(resultSet.next()){
					%>
					<tr>
					<td><%=resultSet.getString("aStart.Vin_Number") %></td>
					<td><%=resultSet.getString("aStart.Seller_Username") %></td>
					<td><%=resultSet.getString("aStart.Category") %></td>
					<td><%=resultSet.getString("aStart.Close_Date_Time") %></td>				
					<td><%=resultSet.getString("aStart.Highest_Bid") %></td>
					
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
		</table><br>
		
		
		<script>
		function myFunction() {
			  // Declare variables
			  var input, input2, filter, filter2, table, tr, td, td2, i;
			  input = document.getElementById("myInput");
			 
			  filter = input.value.toUpperCase();
			
			  table = document.getElementById("AuctionItems");
			  tr = table.getElementsByTagName("tr");
			  for (i = 0; i < tr.length; i++) {
				    td = tr[i].getElementsByTagName("td")[1]; // for column one
				   
				/* ADD columns here that you want you to filter to be used on */
				    if (td){ 
				    	
				      		if ( (td.innerHTML.toUpperCase().indexOf(filter) > -1) && (td2.innerHTML.toUpperCase().indexOf(filter2) > -1) )  {            
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