
<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<%@page import="java.sql.*"%>
<%
String course = request.getParameter("Course");

System.out.println(""+course);
String data="";
Connection conn = null;
String url = "jdbc:mysql://localhost:3306/studentinfo";

String driver = "com.mysql.jdbc.Driver";
String userName = "root"; 
String password = "root";
Class.forName("com.mysql.jdbc.Driver");

int sumcount=0; 
Statement st;
try {
Class.forName(driver).newInstance();

conn = DriverManager.getConnection(url,userName,password);
String query = "select Totalfees from coursedetail where Course='"+course+"'";
System.out.println(query);
st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
while(rs.next())
{
data=":"+rs.getString("Totalfees"); 
}
out.println(data);
}
catch (Exception e) {
e.printStackTrace();
}
%>