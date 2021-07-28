
<%@page import="db.Exam"%>
<%@page import="model.ExamDao"%>
<%@page import="model.StudentsDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<%@page import="model.InstructionsDao"%>
<%@page import="db.Instructions"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date "%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="model.LoginDao"%>  
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
    <title>Exam</title>

      <script>
        <%
        Exam ex = ExamDao.GetExam();
        long clock = 0;
        long examtime = ex.getTime().getTime();
        long curtime = new Date().getTime();
        clock = (examtime - curtime)/1000;
        %>
            var timeout = <%= clock %>
            function timer()
            {
                if( timeout > 0)
                        {
                            timeout--;
                            document.getElementById("timer").innerHTML = Math.floor((timeout/60)) + " : " + (timeout%60);

                            window.setTimeout("timer()", 1000 );

                        }
                else
                        {
                        document.getElementById("timer").innerHTML ="You can start exam. ";
                        document.getElementById("start").disabled = false;
                        forma.submit();
                        }
            }
      </script>

</head>
<body onload="timer()">
    <% String name = StudentsDao.getStudentName(session.getAttribute("username").toString());
        String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(ex.getTime()); 
        int duration = ex.getDuration();
    %> 
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

<center>
<pre>
<table class="table table-hover">
<tr>
 
 <th colspan="2"><center><h4><font color="red">Instructions to Students</font></h4></center></th>
</tr>
<%
   int i = 1;
   ArrayList<Instructions> allinsts = InstructionsDao.getAllRecords();
  for(Instructions e : allinsts)
  {   
  %>
   <tr>
  <td><%=i++%></td>
  <td><%=e.getInstruction()%></td>
  </tr>
   <%}%>
</table>
<%
    
%>
<pre>
<h3>Test is Schedule at <%out.println(date+".");%> The duration of test is <%out.println(duration+" min.");%></h3>

    <h3> Time left to start : <strong id="timer"></strong></h3>

 <button type="button" id="start" class="btn btn-outline-primary btn-lg" onclick="location.href='Exam.jsp'" disabled="">Start Test</button>     
</pre>
</center>
	
</body>
</html>