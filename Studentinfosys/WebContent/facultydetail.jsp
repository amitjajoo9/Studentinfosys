<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@include file="header1.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>FACULTY DETAIL </title>

<script>

	var citiesByState = {
			Odisha: ["Bhubaneswar","Puri","Cuttack"],
			Maharashtra: ["Mumbai","Pune","Nagpur"],
			MadhyaPradesh:["Bhopal","Chhatarpur","Chhindwara","Damoh","Gwalior","Indore","Jabalpur","Khargone","Neemuch","Ratlam","Sagar","Satna","Sehore"],
			Kerala: ["kochi","Kanpur"]
             

			}
			function makeSubmenu(value) {
			if(value.length==0) document.getElementById("citySelect").innerHTML = "<option></option>";
			else {
			var citiesOptions = "";
			for(cityId in citiesByState[value]) {
			citiesOptions+="<option>"+citiesByState[value][cityId]+"</option>";
			}
			document.getElementById("citySelect").innerHTML = citiesOptions;
			}
			}

</script>
<style>
  body{
  width:100%;
  height:100%;
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
                 <br><br>
 <center> <h2>Faculty detail</h2> </center>
<form name="form" action="facultydetail" method="post" onsubmit="return valid">  
 <table align="center"> 

 <tr>
 <td>Faculty name </td>
 <td> <input type="text"name="Facultyname" width="2px" /></td>
  </tr>
 <tr> 
 <td> Qualification </td>
 <td> <select name="Qualification">
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
 </td>
 </tr>
 <tr>
  <td>Experience </td>
   <td> <input type="text" name="Experience"> </td> 
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
 <td>Last work</td>
 <td><input type="text" name="Lastwork"> </td> 
 </tr>
 <tr>
 <td> Department</td>
 <td> <input type="text" name="Department"> </td>
 </tr>
 <tr>
 <td>Email</td>
 <td><input type="text" name="Email">  </td>
 </tr> 
 <tr>
 <td>Mobile no.</td>
 <td> <input type="text" name="Mobileno"/></td>
 </tr> 
 <tr>
 <td>Address</td>
 <td> <textarea rows="4" cols="20" name="Address"></textarea></td>
 </tr>
  <tr>
  <tr>
 <td>State</td>
 <td>
 <select id="countrySelect" size="1" name="state"onchange="makeSubmenu(this.value);" >
<option value="" disabled selected>Choose State</option>
<option>Odisha</option>
<option>Maharashtra</option>
<option>MadhyaPradesh</option>
<option>Kerala</option>
</select>
</td>
</tr>
<tr>
<td>City</td>
<td>
<select id="citySelect" size="1" name="city">
<option value="" disabled selected>Choose City</option>
<option></option>
</select>
</td>
<br>
 <tr>
<td><input type="submit" value="SAVE"  class="btn btn-primary">&nbsp;<input type="reset" value="Reset"  class="btn btn-primary"></input></td>
</tr>

</table>
  </form>
  </div>
               
    </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>

  

</body>

<footer><%@include file="footer.jsp" %></footer>
</html>