<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
<title>STUDENT UPDATE</title>

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
  int Studentid; 
  
  String name_up,owner_up;
  
  Studentid =Integer.parseInt( request.getParameter("Studentid"));
	String Firstname=request.getParameter("Firstname");
	String Lastname=request.getParameter("Lastname");
	String Fathername=request.getParameter("Fathername");
	String Mothername=request.getParameter("Mothername");
	String DOB=request.getParameter("DOB");
	String Gender=request.getParameter("Gender");
	String Course=request.getParameter("Course");
	String Mobileno=request.getParameter("Mobileno");
	String Alternatemobile=request.getParameter("Alternatemobile");
	String Email=request.getParameter("Email");
	String Address=request.getParameter("Address");
	String City=request.getParameter("City");
	String State=request.getParameter("State");
	String Image=request.getParameter("Image");
	String Passyear=request.getParameter("Passyear");
  
  PreparedStatement ps=null; //create statement  
  
  ps=con.prepareStatement("update studregistration set Firstname=?,Lastname=?,Fathername=?,Mothername=?,DOB=?,Gender=?,Course=?,Mobileno=?,Alternatemobile=?,Email=?,Address=?,State=?,City=?,Image=?,Passyear=? where Studentid='"+Studentid+"'"); //sql update query 

	ps.setString(1,Firstname);
	ps.setString(2,Lastname);
	ps.setString(3,Fathername);
	ps.setString(4,Mothername);
	ps.setString(5,DOB);
	ps.setString(6,Gender);
	ps.setString(7,Course);
	ps.setString(8,Mobileno);
	ps.setString(9,Alternatemobile);
	ps.setString(10,Email);
	ps.setString(11,Address);
	ps.setString(12, State);
	ps.setString(13,City);
	ps.setString(14,Image);
	ps.setString(15,Passyear);
	
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
 <th> Student id </th>
 <th>First name</th> 
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
  try
  {
   Class.forName("com.mysql.jdbc.Driver"); //load driver  
  
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentinfo","root","root"); // create connection  
 
   if(request.getParameter("id")!=null) 
   {
    int Studentid=Integer.parseInt(request.getParameter("id"));
  
    String name,owner;
  
    PreparedStatement pstmt=null; // create statement
    
    pstmt=con.prepareStatement("select * from studregistration where Studentid=?"); // sql select query
    pstmt.setInt(1,Studentid);
    ResultSet rs=pstmt.executeQuery(); // execute query store in resultset object rs.
    
    while(rs.next()){
    
   %>
   <tr>
   <td><input type="text" name="Studentid" value="<%=rs.getString("Studentid")%>"></td>
    <td><input type="text" name="Firstname" value="<%=rs.getString("Firstname")%>"></td>
    <td><input type="text" name="Lastname" value="<%=rs.getString("Lastname") %>"></td>
    <td><input type="text" name="Fathername" value="<%=rs.getString("Fathername")%>"></td>
    <td><input type="text" name="Mothername" value="<%=rs.getString("Mothername") %>"></td>
    <td><input type="text" name="DOB" value="<%=rs.getString("DOB") %>"></td>
    <td><input type="text" name="Gender" value="<%=rs.getString("Gender")%>"></td>
     <td><input type="text" name="Course" value="<%=rs.getString("Course")%>"></td>
     <td><input type="text" name="Mobileno" value="<%=rs.getString("Mobileno") %>"></td>
     <td><input type="text" name="Alternatemobile" value="<%=rs.getString("Alternatemobile") %>"></td>
    <td><input type="text" name="Email" value="<%=rs.getString("Email") %>"></td>
    <td><input type="text" name="Address" value="<%=rs.getString("Address")%>"></td>
    <td><input type="text" name="City" value="<%=rs.getString("City")%>"></td>
    <td><input type="text" name="State" value="<%=rs.getString("State") %>"></td>
    <td><input type="text" name="Image" value="<%=rs.getString("Image")%>"></td>
    <td><input type="text" name="Passyear" value="<%=rs.getString("Passyear")%>"></td>
    <td><input type="submit" name="btn_update" value="Update"></td> 
   </tr>
    
    <input type="hidden" name="Studentid" value="<%=Studentid%>">
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
    <h1><a href="Viewstudent.jsp">Back</a></h1>
  </center>
  
 </form>
</body>
</html>