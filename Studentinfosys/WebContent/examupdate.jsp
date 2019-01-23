
   <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
    <%@include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<br>
<title>EXAM RECORD UPDATE</title>
<script>
function validate()
{
 var Studentid = document.form.Studentid.value;
 var Studentname = document.form.Studentname.value;
 var Examyear = document.form.Examyear.value;
 var Course= document.form.Course.value;
 var Semester=document.form.Semester.value;
 var Examtype=document.form.Examtype.value;
 var Subject=document.form.Subject.value;
 if (Studentid==null || Studentid=="")

return false;
}
  if (Studname==null || Studname=="")
	{
	alert("Student name can't be blank");
	return false;
	}	 
</script>
</head>
<body>
<br><br>
 <center> <h2>Exam record update</h2> </center>
<form name="form" action="examrecordservlet" method="post" onsubmit="return valid">  
 <table align="center" border="1px"> 
  <tr>
 <th> Student id </th>
 <th>Student name </th>
 <th>Exam year </th>
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
<td><%=rs.getString("Studentname")%></td>
<td><%=rs.getString("Examyear")%></td>
<td><%=rs.getString("Course")%></td>
<td><%=rs.getString("Semester")%></td>
<td><%=rs.getString("Examtype")%></td>
<td><%=rs.getString("Subject")%></td>
<td><input type="submit" value="Update" style="background-color:#49743D;font-weight:bold;color:#ffffff;"></td>

</tr>

<% 
}
}
catch(Exception e){}
%>
</table>
</form>
</body>
<%@include file="footer.jsp" %>
</html>