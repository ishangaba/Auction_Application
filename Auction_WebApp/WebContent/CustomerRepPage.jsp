<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BuyMe - Customer Rep.</title>
</head>
<body>
	<!-- Default header to be used across all non-authenticated pages -->
		<div style="float: right;">
			<form style="display: inline;" method="post" action="Logout.jsp"><input type="submit" value="Logout"></form>
		</div>
		<div style="clear: both;"></div>
		<hr/>
	<!-- End Header -->
	<h2>Customer Rep. Page</h2>
	
	<h4>Answer Unreplied Questions</h4>
	<form style="display: inline;" method="get" action="AnswerQuestions.jsp"> <input type="submit" value="Go"></form>
	<h4>Edits/Removes Account Info</h4>
	<form method="get" action="EditUser.jsp"><input type="submit" value="Edit"></form>
	<form method="get" action="RemoveUser.jsp"><input type="submit" value="Remove"></form>
	<h4>Remove Bids</h4>
	<form style="display: inline;" method="get" action="RemoveBidsFront.jsp"> <input type="submit" value="Go"></form>
	<h4>Remove Auctions</h4>
	<form style="display: inline;" method="get" action="RemoveAuctionFront.jsp"> <input type="submit" value="Go"></form>
</body>
</html>