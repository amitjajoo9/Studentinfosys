<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@include file="header1.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Course Detail</title>
<script>
function validate()
{
 var Coursecode = document.form.Coursecode.value;
 var Course= document.form.Course.value;
 var Duration = document.form.Duration.value;
 var Year = document.form.Year.value;
 var Totalfees =document.form.Totalfees.value;
 
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
    <center> <h2>Course Detail</h2> </center>
<form name="form" action="coursedetailservlet" method="post" onsubmit="return valid">  
 <table align="center"> 
 <tr>
 <td>Course code</td>
 <td> <input type="text" name="Coursecode" /></td>
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
  <td> Duration </td>
 <td> <select name="Duration">
 <option value="1 Year">1 year</option>
 <option value="2 year">2 year</option>
 <option value="3 year">3 year</option>
 <option value="5 year">5 year</option>
 </select>
  </tr>
 <tr> 
 <td> Year </td>
 <td> <input type="text" name="Year"/></td>
 </tr>
  <tr>
 <td> Total fees </td>
 <td> <input type="text" name="Totalfees" /></td>
 </tr>
<tr>
<td align="right"><input type="submit" value="SAVE" align="right" class="btn btn-primary"> <td><input type="reset" value="RESET" align="right" class="btn btn-primary"></td>
</tr>
</table>
 </form>
</body>
<br><br><br><br><br><br><br><br><br>                
                </div>
                 <!-- /. ROW  -->
                 <hr />
               
    </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
<br></br>

 
  <%@include file="footer.jsp"%>
</html>