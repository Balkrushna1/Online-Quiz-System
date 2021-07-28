<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="model.*"%>
<%@page import="db.Students"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

    <meta charset="ISO-8859-1">
    <style>
        ul.navbar-nav a:hover{
            color: white !important;
            
        }
    </style>
<title>Student Profile</title>
</head>
<body>
    <% String name = StudentsDao.getStudentName(session.getAttribute("username").toString());%> 
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <a class="navbar-brand" href="Home.jsp"><strong>Quick Quizzz</strong></a>
        <ul class="navbar-nav">
          <li class="nav-item"> <a class="nav-link" href="Home.jsp">Home</a></li>
          <li class="nav-item"> <a class="nav-link" href="StudentInstructions.jsp">Test</a></li>

        </ul>
        <ul class="navbar-nav ml-auto">
          <li class="nav-item"><a class="nav-link active" href="Profile.jsp"><i class="fas fa-user"></i> <%out.println(name); %></a></li>
          <li class="nav-item"><a class="nav-link" href="oes.controller.LogoutStudent"><i class="fas fa-sign-out-alt"></i>Logout</a></li>
        </ul>
    </nav>
<table class="table table-bordered table-hover">
<tr tr class="table-dark">
 <th>sl no.</th>
 <th>Userid</th>
 <th>name</th>
 <th>password</th>
 <th>Update</th>
</tr>
<tr>
<%
   int i = 0;
   ArrayList<Students> allstudents = StudentsDao.getAllRecords();
  for(Students e : allstudents)
  {         
	if(e.getUsername().equals(session.getAttribute("username").toString())) {
  
            %>
             <tr>
            <td><%=i++%></td>
            <td><%=e.getUsername() %></td>
            <form action="updatestudentbystudent.jsp">
            <td><input value="<%=e.getName()%>" type="text" name="name"></td>
                <input type="hidden" value="<%=e.getUsername()%>" type="text" name="usernameoriginal">
                <input type="hidden" value="<%=e.getUsername()%>" type="text" name="uname">
                <td><input type="password" value=<%=e.getPassword() %> name="pass" ></input></td>
                <td><button type="submit" value="update" class="btn btn-success">Update</button></td>
            </form>
            </tr>
            <%
        }
  }
  %>

</table>


</body>
</html>