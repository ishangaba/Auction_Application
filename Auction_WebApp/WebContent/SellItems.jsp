<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sell Items</title>
<hr/>
</head>
<body>
	
	<div style="float: left;">
			<form style="display: inline;" method="post" action="UserPage.jsp"><input type="submit" value="Back"></form>
			<form style="display: inline;" method="post" action="Logout.jsp"><input type="submit" value="Logout"></form>
		</div>
		<div style="clear: both;"></div>
		<hr/>
		
	<h1>Sell Vehicle</h1>
	<hr/>
	
	<h3>Enter Vehicle Information</h3>
	
	<h5>VIN Number required; buyers might bid more if there is more accurate information about vehicle posted. Date Format (MM-DD-YYYY)</h5>
	<form method="get" action="SellItemsBack.jsp">
			<table>
				<tr>    
					<td>Vin Number:</td><td><input type="number" name="Vin_Number" required></td>
					<td>Category:</td><td>
						<select name="Category" size=1 required>
							<option value="Car">Car</option>
							<option value="Truck">Truck</option>
							<option value="Bus">Bus</option>
							<!-- 
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
  							<option value="GMC">GMC</option> -->  				
						</select>
					</td><td>Make:</td><td>
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
						</select>
					</td>
					<td>Model:</td><td><input type="text" name="Model" required></td>
					<td>Model Year:</td><td><input type="number" name="Model_Year"></td>
					<td>Mileage:</td><td><input type="number" name="Mileage"></td>
					<td>Accident History:</td><td><input type="text" name="Accident_History"></td>
					<!--  Vin_Number, Seller_Username, Close_Date_Time, Highest_Bid, Initial_Price, Mini_Price, Success, Category
					 -->
					<td>Close Date:</td><td><input type="date" name="Close_Date_Time"></td>
					<td>Initial Price:</td><td><input type="number" name="Initial_Price"></td>
					<td>Min Price:</td><td><input type="number" name="Min_Price"></td>
					
				</tr>
				<tr><td>Increment:</td><td><input type="number" name="Increment"></td></tr>
			</table>
			<!-- Car Type
			<select name="Type" size=1>
				<option value="Sedan">Sedan</option>
				<option value="Truck">Truck</option>
				<option value="Minivan">Minivan</option>
				<option value="Sports Car">Sports Car</option>
			</select>  -->
			<input type="submit" value="Submit">
			
		</form>
	
	
	<h3>Have any Questions? Ask our Customer Rep!</h3>
	<form style="display: inline;" method="post" action="AskCustomerRepQuestions.jsp"><input type="submit" value="Ask Here!"></form>
	
</body>
</html>