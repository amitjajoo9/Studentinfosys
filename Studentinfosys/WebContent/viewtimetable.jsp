   <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
    <%@include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>VIEW TIMETABLE</title>
<script>
function validate()
{
 var Subcode = document.form.Subcode.value;
 var Day = document.form.Day.value;
 var Course = document.form.Course.value;
 var Subject=document.form.Subject.value;
 var Semester=document.form.Semester.value;
 var Examdate=document.form.Examdate.value;
 
 if (Subcode==null || Subcode=="")
	 
       alert ("Subcode can't be blank");
return false;
}

function editRecord(id)
{
 var f=document.form;
 f.method="post";
 f.action='updatetimetable.jsp?id'+id;
 f.submit();
}
</script>

<style type="text/css">
  #container{
    width:100%;
    height:90%;
  
  }
</style>
</head>
<body>

<div id="container">
<br><br>
 <center> <h2>Timetable update</h2> </center>
<form name="form"  method="post" onsubmit="return valid">  
 <table align="center" border='1px' > 
 <tr>
 <th>Sub code</th>
 <th>Day</th> 
 <th>Course </th>
 <th>Subject</th>
 <th>Semester</th>
 <th>Exam date</th>
  <th>Action Update</th>
  <th>Action Delete</th>
 </tr>
<%
 int sumcount=0;
 
try {
	
	Statement st=null;

	 Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentinfo","root","root");
	st=con.createStatement();
	 
String query = "select * from tabletime";
 st = con.createStatement();
ResultSet rs = st.executeQuery(query);
while(rs.next()){
%>
<tr>
<td><%=rs.getString("subid")%></td>
<td><%=rs.getString("Day")%></td>
<td><%=rs.getString("Course")%></td>
<td><%=rs.getString("Subject")%></td>
<td><%=rs.getString("Semester")%></td>
<td><%=rs.getString("Examdate")%></td>
<td><a href="updatetimetable.jsp?id=<%=rs.getString("subid")%>">Update</a></td>
<td><a href="deletetimetable.jsp?id=<%=rs.getString("subid")%>">Delete</a></td>
</tr>
<% 
}
}
catch(Exception e){}
%>

</table>
</form>
</div>
</body>

</html>