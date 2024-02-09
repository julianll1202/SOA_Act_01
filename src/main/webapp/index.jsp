<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="itm.testgfish.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %></h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>
<%
DBConnection conn = new DBConnection();
out.println(conn.Connect());
out.println(conn.getUser(1));
 %>
</body>
</html>