<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> TIMETABLE</title>
<script>
function validate()
{
 var Subcode = document.form.Subcode.value;
 var Day = document.form.Day.value;
 var Course = document.form.Course.value;
 var Subject = document.form.Subject.value;
 var Semester=document.form.Semester.value;
 var Examdate=document.form.Examdate.value;
 
 if (Subcode==null || Subcode=="")
	 alert ("Subcode can't be blank");
return false;
}
 </script>
</head>
<body>
<br></br>
<center> <h2>TIMETABLE</h2> </center>
<form name="form" action="timetableservlet" method="post" onsubmit="return valid">  
 <table align="center"> 
  <tr>
<td> Sub code </td>
 <td> <input type="text" name="Subcode"/></td>
 </tr>
<tr>
 <td>Day </td>
 <td> <select name="Day">
 <option value="Monday">Mon</option>
 <option value="Tuesday">Tue</option>
 <option value="Wednesday">Wed</option>
 <option value="Thursday">Thu</option>
 <option value="Friday">Fri</option>
 <option value="Saturday">Sat</option>
 </select>
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
 <td>Semester</td>
 <td> <select name="Semester">
 <option value="1 Sem">1 Sem</option>
 <option value="2 Sem">2 Sem</option>
 <option value="3 Sem">3 Sem</option>
 <option value="4 Sem">4 Sem</option>
 <option value="5 Sem">5 Sem</option>
 <option value="6 Sem">6 Sem</option>
 </select>
 </tr>
  <tr>
<td> Exam date </td>
 <td> <input type="date" name="Examdate"/></td>
 </tr>
 <tr>
<td> <input type="submit" value="SAVE"> <input type="reset" value="Reset"></input></td>
</tr>
</table>
 </form>
</body>

  <br><br><br><br><br><br><br><br><br>
  <%@include file="footer.jsp"%>
</html>