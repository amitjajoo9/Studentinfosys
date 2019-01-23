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
<title>Insert title here</title>

<script>

 
  
  
  function showstud(stud_value){ 
	    console.log(stud_value)
	  if(document.getElementById("Studentname").value!="-1"){
	  xmlHttp=GetXmlHttpObject();;
	  //var xmlHttp = new XMLHttpRequest();
	 
	 if (xmlHttp==null){
		 console.log(xmlHttp)
	  alert ("Browser does not support HTTP Request")
	  return
	  }
	 var url="getvalue.jsp"
	 url=url+"?Course="+stud_value
			 
    console.log(stud_value);
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
	    
	    alert("Please Select Studentname");
	    document.getElementById("Studentname").value =" ";
	 
	   }
	   else if(strar.length>1) {
	  var strname = strar[1];
	  console.log(strname);
	  document.getElementById("Studentname").value= strar[1];
	  
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
String sql="select * from studregistration"; 
st=con.createStatement();
//ps.setString(1,Course);
rs=st.executeQuery(sql);
%>
<body>
 <center> <h2>Attendance</h2> </center>
<form name="form" action="attendance1servlet" method="post" onsubmit="return valid">  
 <table align="center"> 
  <tr>
 <td> RollNo </td>
 <td> <select id="Studentid" name="Studentid" onchange="showstud(this.value);" >
 <option value="-1" disabled selected>Choose Student</option>
 <%while(rs.next()){%>
 <option value="<%=rs.getString("Studentid")%>"><%=rs.getString("Studentid")%></option>
   <%}%>
 </select>
 </td>
 </tr>
 
<tr>
 <td>Student name</td>
 <td> <input type="text" name="Studentname" /></td>
  </tr>
 <tr>
 <td> Attendance </td>
 <td> <input type="radio" name="Attendance" value="Present">Present
 <input type="radio"name="Attendance" value="Absent">Absent<br></td>
 </tr>
<tr>
<td> <input type="submit" value="submit">  </td>
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

<%@include file="footer.jsp"%>

</body>
</body>
</html>