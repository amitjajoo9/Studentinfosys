<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@include file="header1.jsp" %>
          <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EXAM RECORD</title>
<script>
function validate()
{
 var Studentid = document.form.Studentid.value;
 var Studentname = document.form.Studentname.value;
 var Examyear = document.form.Examyear.value;
 var Course =document.form.Course.value;
 var Semester =document.form.Semester.value;
 var Examtype=document.form.Examtype.value;
 var Subject=document.form.Subject.value;
 
 if (Studentid==null || Studentid=="")
	 
       alert("Student id can't be blank");
      
return false;
}
  if (Studentname==null || Studentname=="")
	{
	alert("Student name can't be blank");
	return false;
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
 <center> <h2>Exam Record</h2> </center>
<form name="form" action="./ExamRecordServlet" method="post" onsubmit="return valid">  
 <table align="center"> 
<tr>
 <td> Student id </td>
 <td> <input type="text" name="Studentid" /></td>
 </tr> 
 <tr>
 <td>Student name </td>
 <td> <input type="text"name="Studentname" /></td>
  </tr>
  <tr>
  <td> Exam year </td>
 <td> <input type ="text" name="Examyear" /></td>
  </tr>
  <tr>
 <td>Course</td>
 <td> <select name="Course">
 <option value="M.sc.">M.sc.</option>
 <option value="B.sc.">B.sc.</option>
 <option value="M.com">M.com.</option>
 <option value="B.com.">B.com.</option>
 <option value="Pgdca">Pgdca</option>
 <option value="M.tech">M.tech</option>
 <option value="B.tech">B.tech</option>
 <option value="M.sc.">phd</option>
 <option value="MCA">MCA</option>
 <option value="BCA">BCA</option>
 </select>
 </tr>
 <tr>
 <td>Semester</td>
 <td> <select name="Semester">
<option value="1st">1st</option>
<option value="2nd">2nd</option>
<option value="3rd">3rd</option>
<option value="4th">4th</option>
<option value="5th">5th</option>
<option value="6th">6th</option> 
 </select> 
 </tr>
<tr>
<td>Exam type</td>
<td> <select name="Examtype">
<option value="Semester">Semester</option>
<option value="Yearly">Yearly</option> 
</select>
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
<td> <input type="submit" value="register"  class="btn btn-primary"> <input type="reset" value="Reset"  class="btn btn-primary"> </td>
</tr>
</table>
 </form>
  
</div>
               
    </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>



<%@include file="footer.jsp"%>

</body>
</html>