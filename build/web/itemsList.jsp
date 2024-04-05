<%-- 
    Document   : itemsList
    Created on : Aug 23, 2022, 7:38:45 PM
    Author     : namee
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
<%
 ArrayList  list = (ArrayList) session.getAttribute("itemsList");
 String  selected_Category = (String) session.getAttribute("selected");
 int i =0;
 if (list != null && (list.size() > 0)) 
 {
%>
<div style="background-color: darkgrey">
<a href="/Shopping.jsp" style="padding:30px">Home</a>
<a href="/Cart.jsp" style="padding:30px">Cart</a>
</div>
<center>
    <br><Br><br>   
<table border="0" cellpadding="0" width="100%" bgcolor="grey">
    

    <caption>List of Items in the category <%= selected_Category%> </caption>
 <tr>
 <th scope="col">Name</th>
 <th scope="col">Description</th>
 <th scope="col">Price</th>
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
  <td>
   <form name="addForm" action="myCart"  method="POST">
   <input type="submit" value="Add">
   <input type="hidden" name= "addindex" value='<%= index %>'>
   <input type="hidden" name="action" value="ADD">
  </form> 
      </td>
    </tr> 
    <% } %>
  </table>
  <p>
      
 
  </center>
<% } %>