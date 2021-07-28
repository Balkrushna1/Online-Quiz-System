<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<%@page import="model.QuestionsDao"%>
<%@page import="model.StudentsDao"%>
<%@page import="db.*"%>
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
    <title>Result</title>
</head>
<body>
    <% String name = StudentsDao.getStudentName(session.getAttribute("username").toString());%> 
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <a class="navbar-brand" href="Home.jsp"><strong>Quick Quizzz</strong></a>
        <ul class="navbar-nav">
          <li class="nav-item"> <a class="nav-link" href="Home.jsp">Home</a></li>
          <li class="nav-item"> <a class="nav-link active" href="StudentInstructions.jsp">Test</a></li>
        </ul>
        <ul class="navbar-nav ml-auto">
          <li class="nav-item"><a class="nav-link" href="Profile.jsp"><i class="fas fa-user"></i> <%out.println(name); %></a></li>
          <li class="nav-item"><a class="nav-link" href="oes.controller.LogoutStudent"><i class="fas fa-sign-out-alt"></i>Logout</a></li>
        </ul>
    </nav>
<%
String[] dbans = new String[100];
ArrayList<Questions> allQuestions = QuestionsDao.getAllRecords();
int i = 0;
int marks[] = new int[100];
int totalmarks = 0;
int size = allQuestions.size();
for(Questions e : allQuestions)
{   
	dbans[i] = e.getAnswer();
        marks[i] = e.getMarks();
        totalmarks += e.getMarks();
	  i++;
}
String[] userans = new String[100];
for(int j = 0 ; j < size ; j++)
{
	userans[j] = request.getParameter(Integer.toString(j));
}
int correctanswer=0;
int unattempted = 0;
int wronganswer=0;
int usermarks = 0;

for(int k = 0 ; k< size;k++)
{
	if(userans[k].equalsIgnoreCase(dbans[k]))
	{
		correctanswer++;
                usermarks += marks[k];
	}
	else if(userans[k].equals("e"))
	{
		unattempted++;
	}
	else
	{
		wronganswer++;
	}
}
int attemped = size - unattempted;
%>
<div class="container mt-5">
    <table class="table table-hover table-striped">
        <thead >
            <tr>
            <th colspan="3" scope="col"><center><pre><h2>Result of Examination</h2></pre></center></th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th scope="row">1</th>
            <td>Total no. of Questions</td>
            <td><%=size %></td>
          </tr>
          <tr>
            <th scope="row">2</th>
            <td>Number Of Questions Attempted</td>
            <td><%=attemped %></td>
          </tr>
          <tr>
            <th  scope="row">3</th>
            <td  >Number of Correct Answers</td>
            <td ><font color="green"><%=correctanswer %></font></td>
          </tr>
           <tr>
            <th  scope="row">4</th>
            <td>Number of Wrong Answers</td>
            <td ><font color="red"><%=attemped-correctanswer %></font></td>
          </tr>
          </tr>
           <tr>
            <th  scope="row">5</th>
            <td>Total Marks</td>
            <td ><font color="green"><%=totalmarks %></font></td>
          </tr>
          </tr>
           <tr>
            <th  scope="row">6</th>
            <td>Marks Received</td>
            <td ><font color="green"><%=usermarks %></font></td>
          </tr>
          <tr>
            <th  scope="row"></th>
            <td colspan="2" class="text-center"><h3><font color="green"><%=usermarks%> / <%=totalmarks%></font></h3</td>
          </tr>
        </tbody>
      </table>
    
</div>
</body>
</html>