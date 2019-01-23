<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
     <%@include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>STUDENT INFO</title>
<script>
function validate()
{
 var Studentid = document.form.Studentid.value;
 var Firstname = document.form.Firstname.value;
 var Lastname = document.form.Lastname.value;
 var Fathername =document.form.Fathername.value;
 var Mothername=document.form.Mothername.value;
 var DOB=document.form.DOB.value;
 var Gender=document.form.Gender.value;
 var Course=document.form.Course.value;
 var Mobileno =document.form.Mobileno.value;
 var Alternatemobile=document.form.Alternatemobile.value;
 var Email=document.form.Email.value;
 var Adress =document.form.Adress.value;
 var City =document.form.City.value;
 var State =document.form.State.value;
 var Image=document.form.Image.value;
 var Passyear=document.form.Passyear.value;
 
 if (Studentid==null || Studentid=="")

     alert ("Student id can't be blank");
return false;
}
  if (Firstname==null || Firstname=="")
	{
	alert("Firstname can't be blank");
	return false;
</script>
</head>
<body>
 <center> <h2>STUDENT INFO UPDATE</h2> </center>
<form name="form" action="updateprocess.jsp" method="post" onsubmit="return valid">  
<table align="center"> 
<tr>
<th> First name</th> 
 <th> Last name </th>
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
 String id=request.getParameter("id");

System.out.println("gfhg"+id);
 int no=Integer.parseInt(id);
 int sumcount=0;
try {
	
	Statement st=null;

	 Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentinfo","root","root");
	st=con.createStatement();
	 
String query = "select * from studregistration where Studentid="+no;
 st = con.createStatement();
ResultSet rs = st.executeQuery(query);
while(rs.next()){
%>
 <tr>
 <td> <input type="text" name="Studentid" value="<%=rs.getString("Studentid")%>" /></td>
 <td> <input type="text" name="Firstname" value="<%=rs.getString("Firstname")%>" /></td>
 <td> <input type="text" name="Lastname" value="<%=rs.getString("Lastname")%>"/></td>
 <td> <input type="text" name="Fathername" value="<%=rs.getString("Fathername")%>"/> </td> 
 <td> <input type="text" name="Mothername" value="<%=rs.getString("Mothername")%>"/> </td> 
 <td> <input type="text" name="DOB" value="<%=rs.getString("DOB")%>"/> </td> 
 <td> <input type="text" name="Gender" value="<%=rs.getString("Gender")%>"/> </td> 
 <td> <input type="text" name="Course" value="<%=rs.getString("Course")%>"/> </td> 
 <td> <input type="text" name="Mobileno" value="<%=rs.getString("Mobileno")%>"/> </td> 
 <td> <input type="text" name="Alternatemobile" value="<%=rs.getString("Alternatemobile")%>"/> </td> 
 <td> <input type="text" name="Email" value="<%=rs.getString("Email")%>"/> </td>  
<td> <input type="text" name="Address" value="<%=rs.getString("Address")%>"/> </td> 
<td> <input type="text" name="City"value="<%=rs.getString("City")%>"/> </td> 
<td> <input type="text" name="State" value="<%=rs.getString("State")%>"/> </td> 
<td> <input type="text" name="Image"value="<%=rs.getString("Image")%>"/> </td> 
<td> <input type="text" name="Passyear" value="<%=rs.getString("Passyear")%>"/> </td> 
  </tr> 
  <tr>
  <td> <input type="submit" value="submit"> <input type="reset" value="Reset"></input></td>
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