<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
<style>
html,body,h1,h2,h3,h4,h5,h6 {font-family: "Roboto", sans-serif}
</style>
<body class="w3-light-grey">
<br>
<br>
    <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
				<li class="text-center">
                    <img src="assets/img/find_user.png" class="user-image img-responsive"/>
					</li>
				
					<li>
                        <a href="#"><i class="fa fa-sitemap fa-3x"></i> Student<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
    
                            <li>
                                <a href="#">Detail<span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                  	
                                    <li>
                                        <a href="Viewstudent.jsp">View Student</a>
                                    </li>
                                   
               
                                </ul>
                               
                            </li>
                        </ul>
                      </li>  
                    
                    <li>
                        <a href="#"><i></i>Attendance<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
    
                            <li>
                                <a href="#">Detail<span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li>
                                        <a href="Attendance1.jsp">Attendance Record</a>
                                    </li>
                                     
                                    <li>
                                        <a href="ViewAttendance.jsp">View Attendance</a>
                                    </li>
                                   
                                </ul>
                               
                            </li>
                        </ul>
                      </li> 
                      <li>
                        <a href="#"><i></i>Exam Record<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
    
                            <li>
                                <a href="#">Detail<span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                   	
                                    <li>
                                        <a href="viewexamrecord.jsp">View Exam</a>
                                    </li>
                                   

                                </ul>
                               
                            </li>
                        </ul>
                      </li> 
                  
                  <li>
						
                    
                   
                 
                </ul>
                              
          <% String facultyname=(String)session.getAttribute("fname");
	     
	%>
               <h3><font size="4"><a href="#"> Welcome  <%out.print(facultyname);%></a></font></h3>
            </div>
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="assets/js/jquery.metisMenu.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>
  <!-- End Page Container -->
</div>
</nav>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<footer >
  <%@include file="footer.jsp" %>
</footer>

</body>
</html>
