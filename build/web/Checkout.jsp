<%-- 
    Document   : Checkout
    Created on : Feb 25, 2013, 11:43:40 AM
    Author     : nazaraf
--%>

<%@ page session="true" import="java.util.*, tableClasses.item" %>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
    
<style>

td,
th {
    border: 1px solid rgb(190, 190, 190);
    padding: 10px;
}

td {
    text-align: center;
    background-color: lightblue;
}


th[scope="col"] {
    background-color: gray;
    color: #fff;
    
}

th[scope="row"] {
    background-color: lightblue;
     font-stretch: condensed;
    font-weight: bolder;
}

caption {
    padding: 10px;
    caption-side: top;
    font-size: larger;
    font-stretch: condensed;
    font-weight: bolder;
    background-color: black;
    color: whitesmoke;
}

table {
    border-collapse: collapse;
    border: 2px solid rgb(200, 200, 200);
    letter-spacing: 1px;
    font-family: sans-serif;
    font-size: .8rem;
}
</style>
<title>Tech Trade - Checkout</title>
</head>
<body bgcolor="Grey">
 
  
 </font>
 <hr><p>
  
 <center>
 <table border="0" cellpadding="0" width="100%" bgcolor="green">
     <caption>Checkout </caption>
   <tr>
 <th scope="col">Name</th>
 <th scope="col">Description</th>
 <th scope="col">Price</th>
 <th scope="col">Quantity</th>
 <th scope="col"></th>
 </tr>
 <%
  ArrayList list = (ArrayList) session.getAttribute("shoppingcart");
  String amount = (String) request.getAttribute("amount");
  for (int i=0; i < list.size();i++) {
   item order = (item) list.get(i);
 %>
 <tr>
  <th scope="row"> <%= order.getName() %></th>
  <td><%= order.getDescription() %></td>
  <td><%= order.getPrice() %></td> 
  <td><%= order.getQuantity() %></td> 
  <td>
 </tr>
 <%
  }
  session.invalidate();
 %>
 <tr>
 <td>  -   </td>
 <td>  -  </td>
 <td><b>TOTAL</b></td>
 <td><b>£<%= amount %></b></td>
 <td>     </td>
 </tr>
 </table>
 <p>
 <a href="Shopping.jsp">Shop more!</a>
 </center>
</body>
</html>