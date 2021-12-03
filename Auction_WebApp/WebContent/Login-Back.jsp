<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="refresh" content="3;url=Login-Front.jsp" />
<title>Login</title>
</head>
<body>
<%
	Connection connect = null;
	try {

		ApplicationDB db = new ApplicationDB();	
		connect = db.getConnection();

		String Username = request.getParameter("username");
		String Password = request.getParameter("password");
		String Login_Type = request.getParameter("Login_Type");

		PreparedStatement temp = null;
		if (Login_Type.equals("user")) temp = connect.prepareStatement("SELECT * FROM User u WHERE u.Username = ? AND u.Password = ?");
		else if (Login_Type.equals("admin")) temp = connect.prepareStatement("SELECT * FROM Admin_Staff a WHERE a.Username = ? AND a.Password = ?");
		else temp = connect.prepareStatement("SELECT * FROM Customer_Rep c WHERE c.Username = ? AND c.Password = ?");
	
		temp.setString(1, Username);
		temp.setString(2, Password);
		
		

		ResultSet result = temp.executeQuery();

		while (result.next()) {
			session.setAttribute("USERNAME", result.getString("Username"));
			if (Login_Type.equals("user")) {
				session.setAttribute("Login_Type", "User");
			} else if (Login_Type.equals("admin")) {
				session.setAttribute("Login_Type", "Admin");
			} else {
				session.setAttribute("Login_Type", "Customer_Representative");
			}
		}

		if (session.getAttribute("USERNAME") == null) out.print("User not found! Incorrect username or password, please try again!");
		else{
			if (session.getAttribute("Login_Type") == "Admin") response.sendRedirect("AdminPage.jsp");
			else if (session.getAttribute("Login_Type") == "Customer_Representative") response.sendRedirect("CustomerRepPage.jsp");
			else response.sendRedirect("UserPage.jsp");
		}

	} catch (Exception e) {
		out.print(e);
		out.print("Login failed.");

	} finally {
		if (connect != null) connect.close();
	}

%>


</body>
</html>