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
  <title>SOA - Add User</title>
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
<h1>Edit User User</h1>
<%
Person user = (Person)request.getAttribute("person");
%>
<div class="row">
    <form class="col s12" action="update" method="post">
      <div class="row">
          <div class="input-field col s6">
            <input  id="id" value="<%=user.getId() %>" readonly  name="id" type="text" class="validate">
            <label for="id">Id</label>
          </div>
      </div>
      <div class="row">
        <div class="input-field col s6">
          <input   id="first_name" value="<%=user.getFirstName() %>" name="firstName" type="text" class="validate">
          <label for="first_name">First Name</label>
        </div>
        <div class="input-field col s6">
          <input id="last_name" value="<%=user.getLastName() %>" name="lastName" type="text" class="validate">
          <label for="last_name">Last Name</label>
        </div>
    </div>
    <div class="row">
        <button type="submit" class="btn waves-effect waves-light deep-purple lighten-1"><i class="material-icons left">edit</i> Update</button>
        <a class="btn waves-effect waves-light green" href="/testGFish-1.0-SNAPSHOT"><i class="material-icons left">home</i> Home</a>
    </div>
    </form>
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