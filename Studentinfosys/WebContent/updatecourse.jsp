<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
<title>COURSE UPDATE</title>

<script>
   function validate()
   {
    var name = document.myform.txt_name;
    var owner = document.myform.txt_owner;
    
    if (name.value == "")
    {
     window.alert("please enter name ?");
     name.focus();
     return false;
    }
    if (owner.value == "")
    {
     window.alert("please enter owner ?");
     owner.focus();
     return false;
    }
   }
   
</script>
<style type="text/css">
  
 .main
 {
  width:700px;;
  margin-left:250px;
  padding: 10px;
  border: 5px solid grey;
   
 }
 table
 {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 600px;
 }
 td
 {
  border: 5px solid silver;
  text-align: left;
  padding: 8px;
 }
</style>
</head>
<body>
<%
try
{
 Class.forName("com.mysql.jdbc.Driver");  //load driver 
 
 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentinfo","root","root"); // create connection 
 
 if(request.getParameter("btn_update")!=null) //check button click event not null
 {
  String Coursecode; 
  
  String name_up,owner_up;
  
 Coursecode=request.getParameter("Coursecode");
	String Course=request.getParameter("Course");
	String Duration=request.getParameter("Duration");
	String Year=request.getParameter("Year");
	String Totalfees=request.getParameter("Totalfees");

	
	
  PreparedStatement ps=null; //create statement  
  
  ps=con.prepareStatement("update coursedetail set Coursecode=?,Course=?,Duration=?,Year=?,Totalfees=? where Coursecode='"+Coursecode+"'"); //sql update query 
  ps.setString(1,Coursecode);
	ps.setString(2,Course);
	ps.setString(3,Duration);
	ps.setString(4,Year);
	ps.setString(5,Totalfees);

	
  ps.executeUpdate(); //execute query
  
  con.close(); //connection close

  out.println("Update Successfully...! Click Back link."); //after update record successfully message
 } 
 
}
catch(Exception e)
{
 out.println(e);
}

%>

<form method="post" name="myform"  onsubmit="return validate();">
 
  <center>
   <h1>Update Record</h1>
  </center>
  
  <table>
   <tr>
 <th>Course code </th>
 <th>Course</th>
 <th>Duration</th> 
 <th>Year</th>
 <th>Total fees</th>

 </tr> 
  <%
  try
  {
	  String Coursecode="";
   Class.forName("com.mysql.jdbc.Driver"); //load driver  
  
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentinfo","root","root"); // create connection  
 
   if(request.getParameter("id")!=null) 
   {
	   Coursecode=request.getParameter("id");
  
    String name,owner;
  
    PreparedStatement pstmt=null; // create statement
    
    pstmt=con.prepareStatement("select * from coursedetail where Coursecode=?"); // sql select query
    pstmt.setString(1,Coursecode);
    ResultSet rs=pstmt.executeQuery(); // execute query store in resultset object rs.
    
    while(rs.next()){
    
   %>
   <tr>
   <td><input type="text" name="Coursecode" value="<%=rs.getString("Coursecode")%>"></td>
    <td><input type="text" name="Course" value="<%=rs.getString("Course") %>"></td>
    <td><input type="text" name="Duration" value="<%=rs.getString("Duration")%>"></td>
    <td><input type="text" name="Year" value="<%=rs.getString("Year") %>"></td>
    <td><input type="text" name="Totalfees" value="<%=rs.getString("Totalfees")%>"></td>
<td><input type="submit" name="btn_update" value="Update"></td> 
   </tr>
   
   <input type="hidden" name="Coursecode" value="<%=Coursecode%>">
  <%
    }
   }
  }
  catch(Exception e)
  {
   out.println(e);
  }
  %> 
  </table> 
  
  <center>
    <h1><a href="viewcourse.jsp">Back</a></h1>
  </center>
  
 </form>
</body>
</html>