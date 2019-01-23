 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
   <%@include file="header1.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>VIEW COURSE</title>
<script>
function validate()
{
 var Coursecode = document.form.Coursecode.value;
 var Course = document.form.Course.value;
 var Duration = document.form.Duration.value;
 var Year=document.form.Year.value;
 var Totalfees=document.form.Totalfees.value;
 
 if (Coursecode==null || Coursecode=="")
	 
       alert ("Coursecode can't be blank");
return false;
}
function editRecord(id)
{
 var f=document.form;
 f.method="post";
 f.action='updatecourse.jsp?id'+id;
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
                 <div id="container">
<br><br>
 <center> <h2>Course Detail</h2> </center>
<form name="form"  method="post" onsubmit="return valid">  
 <table align="center" border='1px' > 
 <tr>
 <th>Course code</th>
 <th>Course </th>
 <th>Duration</th> 
 <th>Year</th>
 <th>Total fees</th>
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
	 
String query = "select * from coursedetail";
 st = con.createStatement();
ResultSet rs = st.executeQuery(query);
while(rs.next()){
%>
<tr>
<td><%=rs.getString("Coursecode")%></td>
<td><%=rs.getString("Course")%></td>
<td><%=rs.getString("Duration")%></td>
<td><%=rs.getString("Year")%></td>
<td><%=rs.getString("Totalfees")%></td>
<td><a href="updatecourse.jsp?id=<%=rs.getInt("Coursecode")%>" class="btn btn-info">Update</a></td>
<td><a href="deletecourse.jsp?id=<%=rs.getInt("Coursecode")%>" class="btn btn-danger">Delete</a></td>
</tr>
<% 
}
}
catch(Exception e){}
%>

</table>
</form>
</div>
               
    </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>

</body>
<%@include file="footer.jsp" %>
</html>