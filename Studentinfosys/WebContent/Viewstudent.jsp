   <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
    <%@include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>STUDENT INFORMATION</title>
<script>
function validate()
{
	 var Studentid = document.form.Studentid.value;
	 var Firstname = document.form.Firstname.value;
	 var Lastname = document.form.Lastname.value;
	 var Fathername = document.form.Fathername.value;
	 var Mothername =document.form.Mothername.value;
	 var DOB =document.form.DOB.value;
	 var Gender =document.form.Gender.value;
	 var Course=document.form.Course.value;
	 var Mobileno=document.form.Mobileno.value;
	 var Alternatemobile=document.form.Alternatemobile.value;
	 var Email=document.form.Email.value;
	 var Address=document.form.Address.value;
	 var City =document.form.City.value;
	 var State =document.form.State.value;
	 var Image=document.form.Image.value;
	 var Passyear=document.form.Passyear.value;
 
 if (Studentid==null || Studentid=="")
	 
       alert ("Student id can't be blank");
return false;
}
  if (studname==null || studname=="")
	{
	alert("Student name can't be blank");
	return false;
	}	 
  function editRecord(id)
  {
   var f=document.form;
   f.method="post";
   f.action='updateregi.jsp?id'+id;
   f.submit();
  }
</script>
</head>
<body>
<br><br>
 <center> <h2>STUDENT INFORMATION</h2> </center>
<form name="form"  method="post" onsubmit="return valid">  
 <table align="center" border='1px'> 
 <tr>
 <td>Student id </td>
 <th>First name</th> 
 <th>Last name </th>
 <th>Father name</th>
 <th>Mother name</th>
 <th>DOB</th>
 <th>Gender</th>
 <th>Course</th>
 <th>Mobile no</th>
 <th>Alternate mobile</th>
 <th>Email</th>
 <th>Address </th>
 <th>City</th>
 <th>State</th>
 <th>Image</th>
 <th>Pass year</th>

 </tr>
<%
 int sumcount=0;
 
try {
	
	Statement st=null;

	 Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentinfo","root","root");
	st=con.createStatement();
	 
String query = "select * from studregistration";
 st = con.createStatement();
ResultSet rs = st.executeQuery(query);
while(rs.next()){
%>
<tr>
<td><%=rs.getString("Studentid")%></td>
<td><%=rs.getString("Firstname")%></td>
<td><%=rs.getString("Lastname")%></td>
<td><%=rs.getString("Fathername")%></td>
<td><%=rs.getString("Mothername")%></td>
<td><%=rs.getString("DOB")%></td>
<td><%=rs.getString("Gender")%></td>
<td><%=rs.getString("Course")%></td>
<td><%=rs.getString("Mobileno")%></td>
<td><%=rs.getString("Alternatemobile")%></td>
<td><%=rs.getString("Email")%></td>
<td><%=rs.getString("Address")%></td>
<td><%=rs.getString("City")%></td>
<td><%=rs.getString("State")%></td>
<td><%=rs.getString("Image")%></td>
<td><%=rs.getString("Passyear")%></td>
<tr>
<td><a href="updateregi.jsp?id=<%=rs.getInt("Studentid")%>">Update</a></td>
 <td><a href="deleteregi.jsp?id=<%=rs.getInt("Studentid")%>">Delete</a></td>
</tr>
<% 
}
}
catch(Exception e){}
%>

</table>
</form>
<%@include file="footer.jsp" %>
</body>
</html>