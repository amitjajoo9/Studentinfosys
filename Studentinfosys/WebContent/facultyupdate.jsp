<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
<title>FACULTY UPDATE</title>

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
  int Facultyid; 
  
  String name_up,owner_up;
  
  Facultyid =Integer.parseInt( request.getParameter("Facultyid"));
	String Facultyname=request.getParameter("Facultyname");
	String Qualification=request.getParameter("Qualification");
	String Experience=request.getParameter("Experience");
	String Subject=request.getParameter("Subject");
	String Lastwork=request.getParameter("Lastwork");
	String Department=request.getParameter("Department");
	String Email=request.getParameter("Email");
	String Mobileno=request.getParameter("Mobileno");
	String Address=request.getParameter("Address");
	String State=request.getParameter("State");
	String City=request.getParameter("City");
  
  PreparedStatement ps=null; //create statement  
  
  ps=con.prepareStatement("update facultydetail set Facultyname=?,Qualification=?,Experience=?,Subject=?,Lastwork=?,Department=?,Email=?,Mobileno=?,Address=?,State=?,City=? where Facultyid='"+Facultyid+"'"); //sql update query 

	ps.setString(1, Facultyname);
	ps.setString(2, Qualification);
	ps.setString(3, Experience);
	ps.setString(4, Subject);
	ps.setString(5, Lastwork);
	ps.setString(6, Department);
	ps.setString(7, Email);
	ps.setString(8, Mobileno);
	ps.setString(9,Address);
	ps.setString(10, State);
	ps.setString(11,City);
	
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
 <th> Faculty id </th>
 <th>Faculty name</th> 
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
 </tr> 
  <%
  try
  {
   Class.forName("com.mysql.jdbc.Driver"); //load driver  
  
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentinfo","root","root"); // create connection  
 
   if(request.getParameter("edit")!=null) 
   {
    int Facultyid=Integer.parseInt(request.getParameter("edit"));
  
    String name,owner;
  
    PreparedStatement pstmt=null; // create statement
    
    pstmt=con.prepareStatement("select * from facultydetail where Facultyid=?"); // sql select query
    pstmt.setInt(1,Facultyid);
    ResultSet rs=pstmt.executeQuery(); // execute query store in resultset object rs.
    
    while(rs.next()){
    
   %>
   <tr>
   <td><input type="text" name="Facultyid" value="<%=rs.getString("Facultyid")%>"></td>
    <td><input type="text" name="Facultyname" value="<%=rs.getString("Facultyname")%>"></td>
    <td><input type="text" name="Qualification" value="<%=rs.getString("Qualification") %>"></td>
    <td><input type="text" name="Experience" value="<%=rs.getString("Experience")%>"></td>
    <td><input type="text" name="Subject" value="<%=rs.getString("Subject") %>"></td>
    <td><input type="text" name="Lastwork" value="<%=rs.getString("Lastwork") %>"></td>
    <td><input type="text" name="Department" value="<%=rs.getString("Department")%>"></td>
    <td><input type="text" name="Email" value="<%=rs.getString("Email") %>"></td>
    <td><input type="text" name="Mobileno" value="<%=rs.getString("Mobileno") %>"></td>
    <td><input type="text" name="Address" value="<%=rs.getString("Address")%>"></td>
    <td><input type="text" name="State" value="<%=rs.getString("State") %>"></td>
    <td><input type="text" name="City" value="<%=rs.getString("City")%>"></td>
    <td><input type="submit" name="btn_update" value="Update"></td> 
   </tr>
    
    <input type="hidden" name="Facultyid" value="<%=Facultyid%>">
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
    <h1><a href="viewfaculty.jsp">Back</a></h1>
  </center>
  
 </form>
</body>
</html>