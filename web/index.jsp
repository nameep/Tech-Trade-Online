<%-- 
    Document   : index
   
    Author     : nazaraf
--%>
<%-- NP
The session attribute indicates whether or not the JSP page uses HTTP sessions. 
A value of true means that the JSP page has access to a builtin session object 
and a value of false means that the JSP page cannot access the builtin session object.
--%>
<%@ page session="true" %>
<html>
<head>
 <title> Tech Trade Online  </title>
</head>
<body bgcolor="Gold">
 
 <hr><p>
 <center>
 <form name="shoppingForm"  action="ItemServlet"  method="POST">
 <b>Book:</b> 
 <select name=item>
  <option> Java | David Bell | 5.50</option>
  <option> Visual Basic | Tony Butcher  | 10.15</option>
  <option> C Programming | Simon Locus | 6.95</option>
  
 </select>
 <b>Quantity: </b><input type="text" name="qty" SIZE="3" value=1>
 <input type="hidden" name="action" value="ADD">
 <input type="submit" name="Submit" value="Add to Cart">
 </form>
 </center>
 <p>
 <jsp:include page="Cart.jsp" flush="true" />
</body>
</html>