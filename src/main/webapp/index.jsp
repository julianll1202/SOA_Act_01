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
<div class="container">
<h1 class="header center blue-text"><%= "SOA - Actividad 1" %></h1>
<div class="section">
<%
PersonDAO p = new PersonDAO();
out.println(p.getUser(1));
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
        ArrayList<Person> people = p.getAllUsers();
        for(int i = 0; i < people.size(); i++) {
            out.println(people.get(i).getId());
    %>
        <tr>
            <td><%=people.get(i).getId() %></td>
            <td><%=people.get(i).getFirstName() %></td>
            <td><%=people.get(i).getLastName() %></td>
            <td>
                <button class="btn-floating waves-effect waves-light deep-purple lighten-1" href="/testGFish-1.0-SNAPSHOT"><i class="material-icons left">edit</i></button>
                <button class="btn-floating waves-effect waves-light red" href="/testGFish-1.0-SNAPSHOT"><i class="material-icons left">delete</i></button>
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
</body>
</html>