<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String id=request.getParameter("Studentid");
//int no=Integer.parseInt(id);
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentinfo", "root", "root");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM studregistration WHERE Studentid="+id);
System.out.println(i);
if(i>0)
{
	
out.println("Data Deleted Successfully!");
   RequestDispatcher rs=request.getRequestDispatcher("updateStud.jsp");
   rs.forward(request, response);
}
else
{
	out.println("Sorry record is not delete successfully");
}
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>