<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<%@ page import="java.sql.*" %>
<%
Connection con=null;
ResultSet rs=null;
 
%>

<!DOCTYPE html>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
  function getSelectcourse()
  {
	  var course=document.getElementById("Course")
	  var selectBox = document.getElementById('selectBox');

	    /* selected value of dropdown */
	    var selectedcourse = course.options[course.selectedIndex].value;
            console.log(selectedcourse);
	    /* selected value set to input field */
	    document.getElementById('tolfee').value = selectedcourse; 
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
	    
	    alert("Please Select Employee Id");
	    document.getElementById("tolfee").value =" ";
	 
	   }
	   else if(strar.length>1) {
	  var strname = strar[1];
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
<form name="form" action="coursedetailservlet" method="post" onsubmit="return valid">  
 <table align="center"> 
<tr>
 <td>Course</td>
 <td> <select id="Course" name="Course" onchange="showEmp(this.value);">
 <option value="-1" disabled selected>Choose Course</option>
 <%while(rs.next()){%>
 <option value="<%=rs.getString("Course")%>"><%=rs.getString("Course")%></option>
   <%}%>
 </select>

<tr>


<tr><td>totalfees</td><td><input id="tolfee" type="text" name="tolfee" value=""></td></tr>
<% 
}

catch(Exception	e1)
{
	System.out.println("error in code"+e1);
}

%>


</table>
</form>
</body>
</html>