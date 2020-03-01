<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style= "background-color: #ADD8E6; text-align:center">
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<h2 style = color:red >
Welcome to Home page.
</h2>
<h3 style = color:red >
your borrower list is here.
</h3>
<% 
try{
int uid= (Integer)session.getAttribute("sessid");
//String unm = (String)session.getAttribute("sessname");

//out.println(sid);
//int uid = Integer.parseInt(sid);
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/sonoo","root","1234");
Statement st= con.createStatement();
ResultSet rs = st.executeQuery("select * from borr where uid="+uid );
%>
<table cellpadding="5" cellspacing="5" border="1" align="center">
<td><b>Borrower id</b></td>
<td><b>Borrower name</b></td>
<td><b>Amount</b></td>
<% 
while(rs.next())
{
%>
<tr>
<td><%=rs.getString("bid") %> </td>
<td><%=rs.getString("bname") %> </td>
<td><%=rs.getString("amount") %> </td>
</tr>
<%
}
%>
</table>
<% 
con.close();
}
catch(Exception e){
	out.println(e);
};

%>
<br>
<br>
<form action="add.html" method="get">
 Add borrower- <input type="submit" value="here">
</form>
<br>
<br>
<form action="rem.html" method="get">
 Remove borrower- <input type="submit" value="here">
</form>
<br>
<br>
<form action="update.html" method="get">
 For update amount click here- <input type="submit" value="here">
</form>

</body>
</html>