<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Faculty Login</title>

  <link rel='stylesheet' href='http://codepen.io/assets/libs/fullpage/jquery-ui.css'>

    <link rel="stylesheet" href="assets/css/style1.css" media="screen" type="text/css" />

</head>
<body>
<%=(String)request.getAttribute("msg") %>

   <br>
<br>
<br>
<br>
  <div class="login-card">
    <h1>Faculty Login</h1><br>
  <form action="./FacultyLoginServlet" method="post">
    <input type="text"  name="facultyid" placeholder="facultyid">
    <input type="password"  name="pass" placeholder="Password">
    <input type="submit" name="login" class="login login-submit" value="login">
  </form>

  <div class="login-help">
                   <a href="#">Forgot Password</a>
  </div>
</div>

</body>
</html>