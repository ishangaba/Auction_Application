<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sell Car</title>
<hr/>
</head>
<body>
	
	<div style="float: left;">
			<form style="display: inline;" method="post" action="UserPage.jsp"><input type="submit" value="Back"></form>
			<form style="display: inline;" method="post" action="Logout.jsp"><input type="submit" value="Logout"></form>
		</div>
		<div style="clear: both;"></div>
		<hr/>
		
	<h1>Sell Car</h1>
	<hr/>
	
	<h3>Enter Vehicle Information</h3>
	
	<form method="get" action="SellCar.jsp">
			<table>
				<tr>    
					<td>Type: </td><td>
						<select name="Type" size=1 required>
							<option value="Sedan">Sedan</option>
							<option value="Limo">Limo</option>
							<option value="Minivan">Minivan</option>
							<option value="SportsCar">Sports Car</option>
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
					</td>
					<td>Number of Doors: </td><td>
						<select name="Doors" size=1 required>
							<option value="2_Doors">2</option>
							<option value="4_Doors">4</option>		
						</select>
					</td>
					
				</tr>
			</table>
			<input type="submit" value="Submit">
		</form>
	
	
	<h3>Have any Questions? Ask our Customer Rep!</h3>
	<form style="display: inline;" method="post" action="AskCustomerRepQuestions.jsp"><input type="submit" value="Ask Here!"></form>
	
</body>
</html>