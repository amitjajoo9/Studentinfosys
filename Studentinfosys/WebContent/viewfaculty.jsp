   <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
    <%@include file="header1.jsp" %>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<br>
<title>VIEW FACULTY</title>

<link rel="stylesheet" href="assets/css/main.css" type="text/css" media="screen , projection"/>

<script>

  function editRecord(id)
  {
   var f=document.form;
   f.method="post";
   f.action='facultyupdate.jsp?id'+id;
   f.submit();
  }
</script>

</head>
<body>
   <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     
          <% String s1=(String)session.getAttribute("adname");
	     
	%>
	 <h3></h3>
<h3><font size="4"><a href="#"> Welcome  <%out.print(s1);%></a></font></h3>
                
                    </div>
                </div>
                
                 <!-- /. ROW  -->
                 <hr />
                 
<br><br>

 <center> <h2>Faculty detail update</h2> </center>
<center><form name="form"  method="post" onsubmit="return valid">  
<table style="width:70%">
 <tr>
 <th width="10px">Facultyid</th>
 <th>Facultyname</th> 
 <th> Qualification </th>
 <th>Experience</th>
 <th>Subject</th>
 <th>Last work</th>
 <th>Department</th>
 <th>Email</th>
 <th>Mobile no</th>
 <th>Address </th>
 <th>State</th>
  <th>City</th>
 <th>Update</th>
<th>Delete</th>
 </tr>
<%
 int sumcount=0;
 
try {
	
	Statement st=null;

	 Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentinfo","root","root");
	st=con.createStatement();
	 
String query = "select * from facultydetail";
 st = con.createStatement();
ResultSet rs = st.executeQuery(query);
while(rs.next()){
%>
<tr>
<td width="10px"><%=rs.getString("Facultyid")%></td>
<td><%=rs.getString("Facultyname")%></td>
<td><%=rs.getString("Qualification")%></td>
<td><%=rs.getString("Experience")%></td>
<td><%=rs.getString("Subject")%></td>
<td><%=rs.getString("Lastwork")%></td>
<td><%=rs.getString("Department")%></td>
<td><%=rs.getString("Email")%></td>
<td><%=rs.getString("Mobileno")%></td>
<td><%=rs.getString("Address")%></td>
<td><%=rs.getString("State")%></td>
<td><%=rs.getString("City")%></td>
<td> <a href="facultyupdate.jsp?edit=<%=rs.getInt("Facultyid")%>"  class="btn btn-info" role="button">Update</a></td>
<td><a href="deletefaculty.jsp?Facultyid=<%=rs.getInt("Facultyid")%>"  type="button" class="btn btn-danger">Delete</a></td>

</tr>
<% 
}
}
catch(Exception e){}
%>
</table>
</form>

</center>            
    </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>

  

</body>


<%@include file="footer.jsp" %>
</body>

</html>