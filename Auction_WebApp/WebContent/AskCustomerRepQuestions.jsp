<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ask Customer Rep Questions Here</title>
</head>
<body>
	
	<div style="float: left;">
			<form style="display: inline;" method="post" action="UserPage.jsp"><input type="submit" value="Back"></form>
			<form style="display: inline;" method="post" action="Logout.jsp"><input type="submit" value="Logout"></form>
		</div>
		<div style="clear: both;"></div>
		</hr>
		
	<h1>Ask Customer Rep Questions Here!</h1>
	<h2>Username, Ticket_Number, Question, Answer, Customer_Rep</h2>
	
	<form method="get" action="AskCustomerBack.jsp">
			<table>
				<tr>    
					<td>Question</td><td><input type="text" name="Question" required></td>
					
			</table>
			
			<input type="submit" value="Submit">
			
		</form>
	
	<!-- <h3>Please fill in the information of the vehicle you want to buy.</h3>
	
	<h5>VIN Number required; buyers might bid more if there is more accurate information about car posted. Date Format (MM-DD-YYYY)</h5>
	<form method="get" action="BuyItemsBack.jsp">
			<table>
				<tr>    
					<td>Vin Number:</td><td><input type="number" name="Vin_Number" required></td>
					<td>Make:</td><td>
						<select name="Make" size=1>
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
					<td>Model:</td><td><input type="text" name="Model"></td>
					<td>Model Year:</td><td><input type="number" name="Model_Year"></td>
					<td>Mileage:</td><td><input type="number" name="Mileage"></td>
					<td>Accident History:</td><td><input type="text" name="Accident_History"></td>
					<td>Close Date:</td><td><input type="date" name="Close_Date_Time"></td>
					<td>Highest Bid:</td><td><input type="number" name="Highest_Bid"></td>
				</tr>
			</table>
			Car Type
			<select name="Type" size=1>
				<option value="Sedan">Sedan</option>
				<option value="Truck">Truck</option>
				<option value="Minivan">Minivan</option>
				<option value="Sports Car">Sports Car</option>
			</select>
			<input type="submit" value="Submit">
			
		</form>
		 -->
</body>
</html>