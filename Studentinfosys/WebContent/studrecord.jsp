<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

  <%@ page import="java.sql.*" %>
<%
Connection con=null;
ResultSet rs=null;
 
%>
    <%@include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Record</title>
<script>
function validate()
{
 var Studentid= document.form.Studentid.value;
 var Name = document.form.Name.value;
 var Course =document.form.Course.value;
 var Joiningdate =document.form.Joiningdate.value;
 var Totalfees=document.form.Totalfees.value;
 var Paidfees=document.form.Paidfees.value;
 var Duefees=document.form.Duefees.value;
 var Mobileno =document.form.Mobileno.value;
 
 if (Studentid==null || Studentid=="")
	
       alert ("Student id can't be blank");
return false;
}
 
  
  
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

function stateChanged(){ 
	  document.getElementById("tolfee").value ="";
	
	  if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete") { 
	  var showdata = xmlHttp.responseText; 
	      var strar = showdata.split(":");
	  if(strar.length==1){
	    
	    alert("Please Select totalfee");
	    document.getElementById("tolfee").value =" ";
	 
	   }
	   else if(strar.length>1) {
	  var strname = strar[1];
	  console.log(strname);
	  document.getElementById("tolfee").value= strar[1];
	  
	   }
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


<br><br>
 <center> <h2>Student Record</h2> </center>
<form name="form" action="studrecordservlet" method="post" onsubmit="return valid">  
 <table align="center"> 
 <tr>
 <td> Student id</td>
 <td> <input type="text" name="Studentid" /></td>
 </tr>
 <tr>
 <td>Name </td>
 <td> <input type="text"name="Name" /></td>
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
 <td>Admission Date</td>
 <td><input type="date" name="Joiningdate" required></td>
<tr><td>totalfees</td><td><input id="tolfee" type="text" name="tolfee" value=""></td></tr>


 <tr>
 <td> Paid fees </td>
 <td> <input type="text" name="Paidfees"> </td>
 </tr>
 <tr>
 
 <tr>
 <td>Duration</td>
 <td> <select name="Duration">
 <option value="1 Year">1 year</option>
 <option value="2 year">2 year</option>
 <option value="3 year">3 year</option>
  <option value="4year">4 year</option>
 <option value="5 year">5 year</option>
 </select>
 </tr>
 <tr>
 <td>Mobile no.</td>
 <td> <input type="text" name="Mobileno"> </td>
 </tr>
 <tr>
 	
 <tr>
 <td><input type="submit" value="register"> <input type="reset" value="Reset"/> </td>
</tr>
</table>
<% 

}
catch(Exception	e1)
{
	System.out.println("error in code"+e1);
}

%>
  </form>
  

<%@include file="footer.jsp"%>

</body>
</html>