<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.sql.*" %>
    <%
Connection con=null;
ResultSet rs=null;
 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ATTENDANCE</title>

<script>
  
  function showEmp(emp_value){ 
	    console.log(emp_value)
	  if(document.getElementById("tolfee").value!="-1"){
	  xmlHttp=GetXmlHttpObject();;
	  //var xmlHttp = new XMLHttpRequest();
	 
	 if (xmlHttp==null){
		 console.log(xmlHttp)
	  alert ("Browser does not support HTTP Request")
	  return
	  }
	 var url="getvalue.jsp"
	 url=url+"?Course="+emp_value
			 
    console.log(emp_value);
	 xmlHttp.onreadystatechange=stateChanged;
	 xmlHttp.open("POST",url,true)
	 xmlHttp.send(null)
	 }
	 else{
	  alert("Please Select Employee Id");
	 }
	 }
	  
function GetXmlHttpObject(){
	  var xmlHttp=null;
	  try{
	   xmlHttp=new XMLHttpRequest();
	   }
	  catch (e) {
	   try {
	    xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
	    }
	   catch (e)  {
	    xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
	    }
	   }
	  return xmlHttp;
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
 <center> <h2>Attendance</h2> </center>
<form name="form" action="RecordAttendServlet" method="post" onsubmit="return valid">  
 <table align="center"> 

 <tr>
 <td>Year</td>
 <td>
 <select name="year">
<option value="1">1</option>
<option value="2">2</option> 
<option value="3">3</option>
<option value="4">4</option>
</select>
</td>
 </tr>
  <tr>
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
 <td>Subject</td>
<td> <select name="Subject">
<option value="Maths">Maths</option>
<option value="science">science</option> 
<option value="java">Java</option>
<option value="Chemistry">chemistry</option>
<option value="physics">physics</option>
<option value="asp.net">asp.net</option>
<option value="vb.net">vb.net</option>
<option value="C++">C++</option>
<option value="C language">C language</option>
<option value="ZOOLOGY">Zoology</option>
<option value="Botony">Botony</option> 
<option value="Micro biology">Micro biology</option>
<option value="computer">Computer</option>
<option value="Information technology">Information technology</option> 
<option value="Economics">Economics</option>
<option value="Tax">Tax</option>
<option value="Accounts">Accounts</option> 
<option value="Statics">Statics</option>
</select>
</td>
 </tr>
<tr>
<td> <input type="submit" value="continue">  </td>
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

</body>
<%@include file="footer.jsp"%>
</html>