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
    <title>Manage Students</title>
</head>
<body>
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <a class="navbar-brand" href="Home.jsp"><strong>Quick Quizzz</strong></a>
        <ul class="navbar-nav">
          <li class="nav-item"> <a class="nav-link" href="AdminPanel.jsp">Admin Panel</a></li>
          <li class="nav-item"> <a class="nav-link active" href="StudentList.jsp">Manage Student</a></li>
          <li class="nav-item"> <a class="nav-link" href="InstructionList.jsp">Manage Instruction</a></li>
          <li class="nav-item"> <a class="nav-link" href="QuestionList.jsp">Manage Questions</a></li>
          <li class="nav-item"> <a class="nav-link" href="ScheduleExam.jsp">Manage Exam</a></li>

        </ul>
        <ul class="navbar-nav ml-auto">
          <li class="nav-item"><a class="nav-link" href="AdminPanel.jsp"><i class="fas fa-user"></i> <%out.println(session.getAttribute("username")); %></a></li>
          <li class="nav-item"><a class="nav-link" href="oes.controller.LogoutAdmin"><i class="fas fa-sign-out-alt"></i>Logout</a></li>
        </ul>
    </nav>
    <h2 style="text-align: center; padding-top: 35px"> <font  color ="black">List of Students</font></h2>
    <table class="table table-bordered table-hover">
        <tr tr class="table-dark">
            <th>sl no.</th>
            <th>Userid</th>
            <th>name</th>
            <th>password</th>
            <th>Update</th>
            <th>Delete</th>
        </tr>
        <tr>
            <%
               int i = 0;
               ArrayList<Students> allstudents = StudentsDao.getAllRecords();
              for(Students e : allstudents)
              {   


              %>
               <tr>
              <td><%=i++%></td>
              <td><%=e.getUsername() %></td>
              <td><%=e.getName()%></td>
              <td><%=e.getPassword() %></td>
              <td><a href="updatestudent.jsp?username=<%=e.getUsername()%>">Update</a></td>
              <td><a href="deletestudent.jsp?username=<%=e.getUsername()%>">Delete</a></td>
        </tr>
          <%
          }
          %>
        <tr>
            <th colspan="6"><center><input type="button" value="Add Student"  class="btn btn-outline-success" onclick="location.href='AddStudent.jsp'"></center></th>
        </tr>
    </table>

</body>
</html>