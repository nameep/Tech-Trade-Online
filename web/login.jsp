<%-- 
    Document   : login
    Created on : Aug 18, 2022, 6:42:50 PM
    Author     : namee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tech Trade Online</title>
    </head>
    <body bgcolor="lightcoral">
        <center>
        <h1>Login</h1>
        <div id='container' style="border:solid maroon; background-color: grey">
  <div >
     <form action="loginServlet" method="post">
     <input type="email" name="email" placeholder="Enter Email" required>
     <br>
     <input type="password" name="password" placeholder="Enter Password" required>
     <br>
     <input type="submit" value="login">
     <br>
     </form>
      
      <p><a href="signup.jsp">SignUp</a></p>
       <p><a href="forgotPassword.jsp">Forgot Password?</a></p>
  </div>
        </center>
    </body>
</html>
