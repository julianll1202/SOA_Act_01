<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="itm.testgfish.model.PersonDAO" %>
<%@ page import="itm.testgfish.model.Person" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
     <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
  <title>JSP - Hello World</title>
</head>
<body>
<nav>
    <div class="nav-wrapper blue lighten-2">
      <a href="/testGFish-1.0-SNAPSHOT" class="brand-logo">SOA</a>
      <ul id="nav-mobile" class="right hide-on-med-and-down">
        <li><a href="collapsible.html">Add user</a></li>
      </ul>
    </div>
  </nav>
<div class="container">
<h1 class="header center  indigo-text darken-4"><%= "SOA - Actividad 1" %></h1>
<div class="section">
<%
PersonDAO p = new PersonDAO();
Person u = p.getUser(4);
out.println(u.getFirstName());
 %>
<table>
    <thead>
        <tr>
            <th>Id</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th></th>
        </tr>
    </thead>
    <%
        ArrayList<Person> people = (ArrayList<Person>)request.getAttribute("people");
        for(int i = 0; i < people.size(); i++) {
    %>
        <tr>
            <td><%=people.get(i).getId() %></td>
            <td><%=people.get(i).getFirstName() %></td>
            <td><%=people.get(i).getLastName() %></td>
            <td>
                <a class="btn-floating waves-effect waves-light deep-purple lighten-1" href="/testGFish-1.0-SNAPSHOT/update-user?id=${people.get(i).getId()}"><i class="material-icons left">edit</i></a>
                <a class="btn-floating waves-effect waves-light red" href="/testGFish-1.0-SNAPSHOT/delete?id=${people.get(i).getId()}"><i class="material-icons left">delete</i></a>
            </td>
        </tr>
    <%
        }
    %>
</table>
</div>
<div class="row">
<a class="btn waves-effect waves-light red" href="/testGFish-1.0-SNAPSHOT/add-user"><i class="material-icons left">add_circle</i> Add User</a>
</div>
</div>
<footer class="page-footer blue lighten-2">
  <div class="container">
    <div class="row">
      <div class="col l6 s12">
        <h5 class="white-text">Julian Lopez Luna - 20490712</h5>
        <p class="grey-text text-lighten-4">Esta es la primer actividad de Arquitectura Orientada a Servicios y consiste en realizar un CRUD con Glassfish y Java EE.</p>
      </div>
    </div>
  </div>
  <div class="footer-copyright">
    <div class="container">
    © 2024 ITMexicali
    <a class="grey-text text-lighten-4 right" href="#!">More Links</a>
    </div>
  </div>
</footer>
</body>
</html>