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
<h1><%= "Hello World!" %></h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>
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
        </tr>
    <%
        }
    %>
</table>
<div class="row">
    <form class="col s12">
      <div class="row">
        <div class="input-field col s6">
          <input placeholder="Placeholder" id="first_name" type="text" class="validate">
          <label for="first_name">First Name</label>
        </div>
        <div class="input-field col s6">
          <input id="last_name" type="text" class="validate">
          <label for="last_name">Last Name</label>
        </div>
    </div>
    <div class="row">
        <button class="btn waves-effect waves-light blue"><i class="material-icons left">add_circle</i> Add</button>
        <button class="btn waves-effect waves-light deep-purple lighten-1"><i class="material-icons left">edit</i> Update</button>
    </div>
    </form>
</div>

</body>
</html>