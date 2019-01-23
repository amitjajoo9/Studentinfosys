   <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
    <%@include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>VIEW EXAM RECORD</title>
<script>
function validate()
{
 var Studentid = document.form.Studentid.value;
 var Studentname = document.form.Studentname.value;
 var Examyear = document.form.Examyear.value;
 var Course=document.form.Course.value;
 var Semester=document.form.Semester.value;
 var Examtype=document.form.Examtype.value;
 var Subject=document.form.Subject.value;
 
 if (Studentid==null || Studentid=="")
	 
       alert ("Student id can't be blank");
return false;
}
function editRecord(id)
{
 var f=document.form;
 f.method="post";
 f.action='updateexamrecord.jsp?Studentid'+Studentid;
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
 <center> <h2>View Exam Record</h2> </center>
<form name="form"  method="post" onsubmit="return valid">  
 <table align="center" border='1px' > 
 <tr>
 <th>Student id</th>
 <th>Student name </th>
 <th>Exam year</th> 
 <th>Course</th>
 <th>Semester</th>
 <th>Exam type</th> 
 <th>Subject</th>
 </tr>
<%
 int sumcount=0;
 
try {
	
	Statement st=null;

	 Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentinfo","root","root");
	st=con.createStatement();
	 
String query = "select * from examrecord";
 st = con.createStatement();
ResultSet rs = st.executeQuery(query);
while(rs.next()){
%>
<tr>
<td><%=rs.getString("Studentid")%></td>
<td><%=rs.getString("Studentname")%></td>
<td><%=rs.getString("Examyear")%></td>
<td><%=rs.getString("Course")%></td>
<td><%=rs.getString("Semester")%></td>
<td><%=rs.getString("Examtype")%></td>
<td><%=rs.getString("Subject")%></td>
<tr>

<td><a href="updateexamrecord.jsp?id=<%=rs.getInt("Studentid")%>">Update</a></td>
<td><a href="deleteexamrecord.jsp?id=<%=rs.getInt("Studentid")%>">Delete</a></td>
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


<%@include file="footer.jsp" %>
</html>