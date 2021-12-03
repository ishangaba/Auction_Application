<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sell Truck</title>
<hr/>
</head>
<body>
	
	<div style="float: left;">
			<form style="display: inline;" method="post" action="UserPage.jsp"><input type="submit" value="Back"></form>
			<form style="display: inline;" method="post" action="Logout.jsp"><input type="submit" value="Logout"></form>
		</div>
		<div style="clear: both;"></div>
		<hr/>
		
	<h1>Sell Truck</h1>
	<hr/>
	
	<h3>Enter Truck Information</h3>
	
	<form method="get" action="SellTruck.jsp">
			<table>
				<tr>    
					<td>Towing Capacity:</td><td><input type="number" name="Towing_Capacity"></td>
					
				</tr>
			</table>
			<input type="submit" value="Submit">
		</form>
	
	
	<h3>Have any Questions? Ask our Customer Rep!</h3>
	<form style="display: inline;" method="post" action="AskCustomerRepQuestions.jsp"><input type="submit" value="Ask Here!"></form>
	
</body>
</html>