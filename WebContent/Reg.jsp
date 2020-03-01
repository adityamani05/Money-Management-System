<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta http-equiv="refresh" content="15">
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<% 
int uid = Integer.parseInt(request.getParameter("uid"));
session.setAttribute("sessid",uid);
String uname = request.getParameter("uname");
session.setAttribute("sessname",uname);
String pass = request.getParameter("pass");
String mno = request.getParameter("mobileno");
try{
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/sonoo","root","1234");
Statement st= con.createStatement();
int rs = st.executeUpdate("insert into user (uid,pass,uname,mno) values('"+uid+"','"+pass+"','"+uname+"','"+mno+"');" );
con.close();
//if(rs!=0){


response.sendRedirect("main.jsp");

System.out.println("Sign up succsessfull");

//}
//else{
//out.println("User id is taken. please try with another one ");
//}
}
catch(Exception e){
	e.printStackTrace();
	out.println("User id is taken. please try with another one ");
}

%>
</body>
</html>