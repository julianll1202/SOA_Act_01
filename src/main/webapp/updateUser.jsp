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
<div class="container">
<h1>Add New User</h1>

<div class="row">
    <form class="col s12" action="add" method="post">
      <div class="row">
        <div class="input-field col s6">
          <input placeholder="Placeholder" id="first_name" name="firstName" type="text" class="validate">
          <label for="first_name">First Name</label>
        </div>
        <div class="input-field col s6">
          <input id="last_name" name="lastName" type="text" class="validate">
          <label for="last_name">Last Name</label>
        </div>
    </div>
    <div class="row">
        <button type="submit" class="btn waves-effect waves-light blue"><i class="material-icons left">add_circle</i> Add</button>
        <a class="btn waves-effect waves-light green" href="/testGFish-1.0-SNAPSHOT"><i class="material-icons left">home</i> Home</a>
        <button class="btn waves-effect waves-light deep-purple lighten-1"><i class="material-icons left">edit</i> Update</button>
    </div>
    </form>
</div>
</div>
</body>
</html>