 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
    <%@include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>VIEW STUDENT RECORD</title>
<script>
function validate()
{
 var Studentid = document.form.Studentid.value;
 var Name = document.form.Name.value;
 var Course =document.form.Course.value;
 var Joiningdate =document.form.Joiningdate.value;
 var Totalfees=document.form.Totalfees.value;
 var Paidfees=document.form.Paidfees.value;
 var Duefees=document.form.Duefees.value;
 var Mobileno =document.form.Mobileno.value;
 if (Studentid==null || Studentid=="")
	 
       alert ("Studentid can't be blank");
return false;
}

function editRecord(id)
{
 var f=document.form;
 f.method="post";
 f.action='updatestudrecord.jsp?id'+id;
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
 <center> <h2>student record update</h2> </center>
<form name="form"  method="post" onsubmit="return valid">  
 <table align="center" border='1px' > 
 <tr>
 <th>Student id</th>
 <th>Name </th>
 <th>Course</th> 
 <th>Joining date</th>
 <th>Total fees</th>
 <th>Paid fees</th> 
 <th>Due fees</th>
 <th>Mobile no.</th>
 </tr>
<%
 int sumcount=0;
 
try {
	
	Statement st=null;

	 Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentinfo","root","root");
	st=con.createStatement();
	 
String query = "select * from studrecord";
 st = con.createStatement();
ResultSet rs = st.executeQuery(query);
while(rs.next()){
%>
<tr>
<td><%=rs.getString("Studentid")%></td>
<td><%=rs.getString("Name")%></td>
<td><%=rs.getString("Course")%></td>
<td><%=rs.getString("Joiningdate")%></td>
<td><%=rs.getString("Totalfees")%></td>
<td><%=rs.getString("Paidfees")%></td>
<td><%=rs.getString("Duefees")%></td>
<td><%=rs.getString("Mobileno")%></td>
<tr>

<td><a href="updatestudrecord.jsp?id=<%=rs.getInt("Studentid")%>">Update</a></td>
<td><a href="deletestudrecord.jsp?id=<%=rs.getInt("Studentid")%>">Delete</a></td>
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