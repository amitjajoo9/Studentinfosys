<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="header.jsp" %>
      <%@ page import="java.sql.*" %>
<%
Connection con=null;
ResultSet rs=null;
 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Registration form </title>
<script>



	var citiesByState = {
			Odisha: ["Bhubaneswar","Puri","Cuttack"],
			Maharashtra: ["Mumbai","Pune","Nagpur"],
			MadhyaPradesh:["Bhopal","Chhatarpur","Chhindwara","Damoh","Gwalior","Indore","Jabalpur","Khargone","Neemuch","Ratlam","Sagar","Satna","Sehore"],
			Kerala: ["kochi","Kanpur"]


			}
			function makeSubmenu(value) {
			if(value.length==0) document.getElementById("citySelect").innerHTML = "<option></option>";
			else {
			var citiesOptions = "";
			for(cityId in citiesByState[value]) {
			citiesOptions+="<option>"+citiesByState[value][cityId]+"</option>";
			}
			document.getElementById("citySelect").innerHTML = citiesOptions;
			}
			}

	 
</script>
</head>

<% 
try
{
Class.forName("com.mysql.jdbc.Driver"); //load driver  
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentinfo","root","root");
Statement st=null;
String sql="select * from coursedetail"; 
st=con.createStatement();
//ps.setString(1,Course);
rs=st.executeQuery(sql);
%>
<body>
<br><br>
 <center> <h2>Student Registration</h2> </center>
<form name="form" action="RegistrationServlet" method="post" onsubmit="return valid">  
 <table align="center"> 
  <tr>
 <tr>
 <td>First name </td>
 <td> <input type="text"name="Firstname" required/></td>
  </tr>
  <tr>
  <td> Last name </td>
 <td> <input type ="text" name="Lastname" required /></td>
  </tr>
  <tr>
   <td>Father's name</td>
   <td><input type="text" name="Fathername" required>  </td>
 </tr>
 <tr>
 <td> Mother's name</td>
 <td><input type="text" name="Mothername" required> </td> 
 </tr>
 <tr> 
 <td>DOB </td>
 <td> <input type="date" name="DOB" required/></td>
 </tr>
  <tr>
 <td> Gender </td>
 <td> <input type="radio" name="Gender" value="Male"required>Male
 <input type="radio" name="Gender" value="Female">Female</td>
 </tr>
<td>Course</td>
 <td> <select id="Course" name="Course" onchange="showEmp(this.value);">
 <option value="-1" disabled selected>Choose Course</option>
 <%while(rs.next()){%>
 <option value="<%=rs.getString("Course")%>"><%=rs.getString("Course")%></option>
   <%}%>
 </select>
 </td>
 </tr>
 <tr>
  <td>Email </td>
  <td> <input type="text" name="Email" required> </td> 
   </tr>
 <tr>
 <td>Mobile no</td>
 <td><input type="text" name="Mobileno" required>  </td>
 </tr> 
 <tr>
 <td> Alternate mobile</td>
 <td> <input type="text" name="Alternatemobile"/></td>
 </tr> 
 <tr>
 <td> Address </td>
 <td> <textarea rows="4" cols="20" name="Address" required></textarea></td>
 </tr>
  <tr>
 <td>State</td>
 <td>
 <select id="countrySelect" size="1" onchange="makeSubmenu(this.value);">
<option value="" disabled selected>Choose State</option>
<option>Odisha</option>
<option>Maharashtra</option>
<option>MadhyaPradesh</option>
<option>Kerala</option>
</select>
</tr>
 <tr>
 <td>City</td>
<td>
<select id="citySelect" size="1" >
<option value="" disabled selected>Choose City</option>
<option></option>
</select>
</td>
 
 </tr>

 <!-- <tr align="right">
 <td>Image upload </td>
 <td> <input type="file" name="Image" width="2px" /></td>
  </tr>-->
 <tr>
 <td>Graduate year</td>
 <td>  <input type="text" name="Passyear" ></td>
 </tr>
 <tr>
<td> <input type="submit" value="register"> <input type="reset" value="Reset"></input></td>
</tr>
</table>
  </form>
  
<% 

}
catch(Exception	e1)
{
	System.out.println("error in code"+e1);
}

%>
<%@include file="footer.jsp" %>
</body>


</html>