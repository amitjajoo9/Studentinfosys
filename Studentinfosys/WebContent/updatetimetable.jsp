<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
<title>TIMETABLE UPDATE</title>

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
  String Subcode; 
  

  
  Subcode=request.getParameter("subid");
	String Day=request.getParameter("Day");
	String Course=request.getParameter("Course");
	String Subject=request.getParameter("Subject");
	String Semester=request.getParameter("Semester");
	String Examdate=request.getParameter("Examdate");
   // System.out.println(Subcode);
  PreparedStatement ps=null; //create statement  
  String query="update tabletime set day=?,Course=?,Subject=?,Semester=?,Examdate=? where Subid='"+Subcode+"'";
  ps=con.prepareStatement(query	); //sql update query 
  //ps.setString(1,Subcode);
	ps.setString(2,Day);
	ps.setString(3,Course);
	ps.setString(4,Subject);
	ps.setString(5,Semester);
	ps.setString(6,Examdate);
	
 int i= ps.executeUpdate(); //execute query
  
  con.close(); //connection close
if(i==1)
{
  out.println("Update Successfully...! Click Back link."); //after update record successfully message
  RequestDispatcher rd=request.getRequestDispatcher("viewtimetable.jsp");
  rd.forward(request, response);
}
else
{
	 out.println("Error in code");
}


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
 <th> Sub code </th>
 <th>Day</th> 
 <th>Course</th>
 <th>Subject</th>
 <th>Semester</th>
 <th>Exam date</th>
 </tr> 
  <%
  try
  {
   Class.forName("com.mysql.jdbc.Driver"); //load driver  
  
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentinfo","root","root"); // create connection  
 
   if(request.getParameter("id")!=null) 
   {
   String Subcode=request.getParameter("id");
  
    String name,owner;
  
    PreparedStatement pstmt=null; // create statement
    
    pstmt=con.prepareStatement("select * from tabletime where subid=?"); // sql select query
    pstmt.setString(1,Subcode);
    ResultSet rs=pstmt.executeQuery(); // execute query store in resultset object rs.
    
    while(rs.next()){
    
   %>
   <tr>
   <td><input type="text" name="subid" value="<%=rs.getString("subid")%>"></td>
    <td><input type="text" name="Day" value="<%=rs.getString("Day")%>"></td>
    <td><input type="text" name="Course" value="<%=rs.getString("Course") %>"></td>
    <td><input type="text" name="Subject" value="<%=rs.getString("Subject") %>"></td>
    <td><input type="text" name="Semester" value="<%=rs.getString("Semester") %>"></td>
    <td><input type="text" name="Examdate" value="<%=rs.getString("Examdate")%>"></td>

    <td><input type="submit" name="btn_update" value="Update"></td> 
   </tr>
    
    <input type="hidden" name="Subcode" value="<%=Subcode%>">
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
    <h1><a href="viewtimetable.jsp">Back</a></h1>
  </center>
  
 </form>
</body>
</html>