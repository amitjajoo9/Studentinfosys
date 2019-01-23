<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String id=request.getParameter("Facultyid");
//int no=Integer.parseInt(id);
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentinfo", "root", "root");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM facultydetail WHERE Facultyid="+id);
System.out.println(i);
if(i>0)
{
	
out.println("Data Deleted Successfully!");
   RequestDispatcher rs=request.getRequestDispatcher("facultyupdate.jsp");
   rs.forward(request, response);
}
else
{
	out.println("Sorry date is not delete successfully");
}
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>