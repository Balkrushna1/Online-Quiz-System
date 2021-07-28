
<%@page import="db.Exam"%>
<%@page import="model.ExamDao"%>
<%@page import="model.StudentsDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<%@page import="model.InstructionsDao"%>
<%@page import="db.Instructions"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.LoginDao"%>  
<%  Exam ex = ExamDao.GetExam();  %>  
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
    <title>Student Home</title>
</head>
<body>
    <% String name = StudentsDao.getStudentName(session.getAttribute("username").toString());%> 
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <a class="navbar-brand" href="Home.jsp"><strong>Quick Quizzz</strong></a>
        <ul class="navbar-nav">
          <li class="nav-item"> <a class="nav-link active" href="Home.jsp">Home</a></li>
          <li class="nav-item"> <a class="nav-link" href="StudentInstructions.jsp">Test</a></li>
        </ul>
        <ul class="navbar-nav ml-auto">
          <li class="nav-item"><a class="nav-link" href="Profile.jsp"><i class="fas fa-user"></i> <%out.println(name); %></a></li>
          <li class="nav-item"><a class="nav-link" href="oes.controller.LogoutStudent"><i class="fas fa-sign-out-alt"></i>Logout</a></li>
        </ul>
    </nav>


<h2 style="text-align: center; padding: 50px 0px"> <font  color ="black">Welcome to Quick Quizzz</font></h2>
<div class="text-center">
    <button class="btn btn btn-outline-primary btn-lg" onclick="location.href='StudentInstructions.jsp'">Attempt Test</button>  
</div>
</body>
</html>