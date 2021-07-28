<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="model.InstructionsDao"%>
<%@page import="db.Instructions"%>
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
    <title>Manage Instructions</title></head>
<body>
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <a class="navbar-brand" href="Home.jsp"><strong>Quick Quizzz</strong></a>
        <ul class="navbar-nav">
          <li class="nav-item"> <a class="nav-link" href="AdminPanel.jsp">Admin Panel</a></li>
          <li class="nav-item"> <a class="nav-link" href="StudentList.jsp">Manage Student</a></li>
          <li class="nav-item"> <a class="nav-link active" href="InstructionList.jsp">Manage Instruction</a></li>
          <li class="nav-item"> <a class="nav-link" href="QuestionList.jsp">Manage Questions</a></li>
          <li class="nav-item"> <a class="nav-link" href="ScheduleExam.jsp">Manage Exam</a></li>

        </ul>
        <ul class="navbar-nav ml-auto">
          <li class="nav-item"><a class="nav-link" href="AdminPanel.jsp"><i class="fas fa-user"></i> <%out.println(session.getAttribute("username")); %></a></li>
          <li class="nav-item"><a class="nav-link" href="oes.controller.LogoutAdmin"><i class="fas fa-sign-out-alt"></i>Logout</a></li>
        </ul>
    </nav>
    <h2 style="text-align: center; padding-top: 35px"> <font  color ="black">List of Instructions</font></h2>
    
    <table class="table table-bordered table-hover">
        <tr tr class="table-dark">
            <th>sl no.</th>
            <th>Instruction</th>
            <th>Operation</th>
            <th>delete</th>
        </tr>
        <%
           int i = 0;
           ArrayList<Instructions> allinsts = InstructionsDao.getAllRecords();
          for(Instructions e : allinsts)
          {   
          %>
            <tr>
                <td><%=i++%></td>
                <td><%=e.getInstruction()%></td>

                <td><a href="updateinstruction.jsp?inst=<%=e.getInstruction()%>">Update</a></td>
                <td><a href="deleteinstruction.jsp?inst=<%=e.getInstruction()%>">Delete</a></td>

            </tr>
          <%
          }
          %>
        <tr>
            <th colspan="4"  rowspan="2"><center><input type="button" class="btn btn-outline-success"value="Add Instruction" onclick="location.href='AddInstruction.jsp'"></center></th>
        </tr>
    </table>


</body>
</html>