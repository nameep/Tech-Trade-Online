<%-- 
    Document   : Shopping
    Created on : Aug 21, 2022, 12:35:22 AM
    Author     : namee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*, tableClasses.item.*"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {box-sizing: border-box}
body {font-family: "Lato", sans-serif;}

/* Style the header */
header {
  background-color: #000000;
  padding: 10px;
  text-align: center;
  font-size: 50px;
  color: whitesmoke;
}
.scroll-left {
 height: 50px;	
 overflow: hidden;
 position: relative;
 background: blanchedalmond; 
 color: firebrick;
 font-style: italic
 
  /* Starting position */
 transform:translateX(100%);
 /* Apply animation to this element */
 animation: scroll-left 15s linear infinite;
}
/* Move it (define the animation) */
@keyframes scroll-left {
 0%   {
 transform: translateX(100%); 		
 }
 100% {
 transform: translateX(-100%); 
 }

}
* {
  box-sizing: border-box;
}

/* Create two unequal columns that floats next to each other */
.column {
  float: left;
  padding: 10px;
  height: 500px; 
}

.left {
  width: 25%;
}

.right {
  width: 75%;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;

}

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
</head>
<body bgcolor="BlanchedAlmond">

<header>
<h2>Tech Trade Online</h2>
</header>
    <div class="scroll-left">
        <h2>We have just the right one for you...!!! Come shop from TECH TRADE ONLINE...</h2>
    </div>

<jsp:include page="/categoryServlet" flush="true" />

<div class="row">
    
    <div class="column left" style="background-color:lightsalmon;">
        <p style="font-style: italic; font-size:large ; color:whitesmoke ; background-color:black ">CATEGORIES</p>
  <%
  ArrayList  list = (ArrayList) session.getAttribute("categoriesList");
 for (int index=0; index <list.size();index++) {
%>
    
<a href="/itemServlet?category=<%=list.get(index).toString()%>"><%= list.get(index).toString()%></a>
<%-- <button class="tablinks"  onclick="itemsList.jsp?id=<%=list.get(index).toString() %>" id="defaultOpen"><%= list.get(index).toString()%></button> --%>
<br>
<% if(index == 0)
{
String categorySelected = list.get(0).toString();
}
}
%>
</div>
<div class="column right" style="background-color:darksalmon;">
    <P style="font-style: italic; font-size:large; background-color: black; color:whitesmoke">New Arrivals</P>
    <table class="table">
        <caption>Keyboard</caption>
    <tr>
        <th scope="col">Name</th>
        <th scope="col">Description</th>
        <th scope="col">Price</th>
    </tr>
    <tr>
        <th scope="row">ADVENT K112 Keyboard </th>
        <td>Full-size |  Black</td>
        <td>£4.99</td>
    </tr>
  
    <tr>
        <th scope="row">LOGITECH K380 </th>
        <td>Wireless Keyboard - Dark Grey</td>
        <td>£25.99</td>
    </tr>
</table>
    <br>
        <table class="table">
        <caption>Mouse</caption>
    <tr>
        <th scope="col">Name</th>
        <th scope="col">Description</th>
        <th scope="col">Price</th>
    </tr>
    <tr>
        <th scope="row">HP 430  </th>
        <td>Multi-Device Wireless Optical Mouse</td>
        <td>£29.99</td>
    </tr>
  
    <tr>
        <th scope="row">LOGITECH M185  </th>
        <td>Wireless Optical Mouse - Black & Red</td>
        <td>£9.99</td>
    </tr>

</div>
</div>
</body>
</html> 
