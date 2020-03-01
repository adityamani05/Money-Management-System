<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<body>
<% 
try{
String bid = request.getParameter("bid");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/sonoo","root","1234");
Statement st= con.createStatement();
int rs = st.executeUpdate("DELETE FROM borr WHERE bid="+bid+";");
out.println("borrower deleted succsessfully");
con.close();
response.sendRedirect("main.jsp");

}
catch(Exception e){
	out.println(e);
}
%>
</body>
</html>