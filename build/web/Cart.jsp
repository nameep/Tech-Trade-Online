<%-- 
   
--%>



<%@ page session="true" import="java.util.*, tableClasses.item" %>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
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
<div style="background-color: darkgrey">
<a href="/Shopping.jsp" style="padding:30px">Home</a>
<a href="/itemsList.jsp" style="padding:30px">List of Items</a>
</div>
<center>
<table border="0" cellpadding="0" width="100%" bgcolor="grey">
<caption>My Cart </caption>
<%
 ArrayList  list = (ArrayList) session.getAttribute("shoppingcart");
 String amount = (String) request.getAttribute("amount");
 String msgDelete = (String) request.getAttribute("deleteMsg");
 String msgAdd = (String) request.getAttribute("addMsg");
 if (list != null && (list.size() > 0)) 
 {
%>

  <tr>
 <th scope="col">Name</th>
 <th scope="col">Description</th>
 <th scope="col">Price</th>
 <th scope="col">Quantity</th>
 <th scope="col"></th>
 </tr>
 <%
  for (int index=0; index <list.size();index++) {
   item Item = (item) list.get(index);
 %>
  <tr>
  <th scope="row"><%= Item.getName() %></th>
  <td><%= Item.getDescription() %></td>
  <td><%= Item.getPrice() %></td> 
  <td><%= Item.getQuantity() %></td> 
  <td>
   <form name="deleteForm" action="myCart"  method="POST">
   <input type="submit" value="Delete">
   <input type="hidden" name= "deleteindex" value='<%= index %>'>
   <input type="hidden" name="action" value="DELETE">
  </form> 
      </td>
    </tr> 
    <% } %>
    <tr>
 <td>  -   </td>
 <td>  -  </td>
 <td><b>TOTAL</b></td>
 <td><b>£<%= amount %></b></td>
 <td>     </td>
 </tr>
  </table>
  <p>
  <% if(msgDelete != null) {%>
  <p style="color:red;"><%= msgDelete %><p>
  <% msgDelete = null; }
      if(msgAdd != null) {%>
  <p style="color:green;"><%= msgAdd %><p>
  <% msgAdd = null;}  %> <p>    
  <form name="checkoutForm"   action="myCart"  method="POST">
    <input type="hidden" name="action" value="CHECKOUT">
    <input type="submit" name="Checkout" value="Checkout">
  </form>
  </center>
<% }
else
{
%>
<h1>Sorry!... Your Cart is empty. </h1>
<%
}%>