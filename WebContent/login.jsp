<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%
int userid = Integer.parseInt(request.getParameter("uname"));
session.setAttribute("sessid",userid);
String pwd = request.getParameter("pass");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/sonoo","root","1234");
Statement st= con.createStatement();
ResultSet rs = st.executeQuery("select * from user where uid='"+ userid+"'");
if(rs.next()){
	if(rs.getString(2).equals(pwd))
	{	
		response.sendRedirect("main.jsp");
		out.println("welcome"+ userid);
	}
	else
	{	
		out.println("invalid password");
		response.sendRedirect("LoginForm.html");
	}
}
con.close();
%>

</body>
</html>