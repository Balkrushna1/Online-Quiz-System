<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
        .container{
            display: flex;
            justify-content: center;
        }
        .container div{
            margin: 20px;
        }
        .container div input{
            height: 200px;
        }
        .heading{

        }
        .heading{

        }
    </style>
    <title>Admin Panel</title>
</head>
<body>
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <a class="navbar-brand" href="Home.jsp"><strong>Quick Quizzz</strong></a>
        <ul class="navbar-nav">
          <li class="nav-item"> <a class="nav-link active" href="AdminPanel.jsp">Admin Panel</a></li>
          <li class="nav-item"> <a class="nav-link" href="StudentList.jsp">Manage Student</a></li>
          <li class="nav-item"> <a class="nav-link" href="InstructionList.jsp">Manage Instruction</a></li>
          <li class="nav-item"> <a class="nav-link" href="QuestionList.jsp">Manage Questions</a></li>
          <li class="nav-item"> <a class="nav-link" href="ScheduleExam.jsp">Manage Exam</a></li>

        </ul>
        <ul class="navbar-nav ml-auto">
          <li class="nav-item"><a class="nav-link" href="AdminPanel.jsp"><i class="fas fa-user"></i> <%out.println(session.getAttribute("username")); %></a></li>
          <li class="nav-item"><a class="nav-link" href="oes.controller.LogoutAdmin"><i class="fas fa-sign-out-alt"></i>Logout</a></li>
        </ul>
    </nav>
    <h2 style="text-align: center; padding-top: 35px"> <font  color ="black">Welcome to Quick Quizzz</font></h2>
    <div class="container">
        <div class="row">
            <div class="col-sm-5"><center><input onclick="location.href='StudentList.jsp';" type="button" value="Add/Update Student" class="btn btn-outline-primary btn-lg btn-block"></center> </div>
            <div class="col-sm-5"><center><input onclick="location.href='InstructionList.jsp';" type="button" value="Add/Update Instructions" class="btn btn-outline-primary btn-lg btn-block"></center></div>
             <div class="col-sm-5"><center><input onclick="location.href='QuestionList.jsp'"type="button" value="Add/Update Question" class="btn btn-outline-primary btn-lg btn-block"></center></div>
            <div class="col-sm-5"><center><input onclick="location.href='ScheduleExam.jsp'"type="button" value="Schedule Exam" class="btn btn-outline-primary btn-lg btn-block"></center></div>

        </div>  
    </div>
 
</body>
</html>