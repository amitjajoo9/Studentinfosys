<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Count Rows JSP</title>
</head>
<body>
<%
try
{
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentinfo","root","root"); 
Statement st=con.createStatement();
String email=request.getParameter("email");
String strQuery = "SELECT password FROM admlogin where email='"+email+"'";
ResultSet rs = st.executeQuery(strQuery);
while(rs.next()){
String email1 = rs.getString(3);

if(email.equals(email1)){

	
out.println("Password send to your email id successfully !");
RequestDispatcher rd=request.getRequestDispatcher("Adminlogin.jsp");
rd.forward(request, response);
 
}
else{
out.println("Invalid Email Id !");
}
}
}
catch (Exception e){
e.printStackTrace();
}
%>
</body>
</html>