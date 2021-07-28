
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
 <%@page import="model.QuestionsDao"%>
 <%@page import="model.StudentsDao"%>
 <%@page import="java.util.Date"%>
 <%@page import="model.ExamDao"%>
 <%@page import="java.text.SimpleDateFormat"%>
 <%@page import="db.*"%>
<%@ page import="java.util.*" %>


<HTML>
    <HEAD>
        <TITLE>Examination </TITLE>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

        <meta charset="ISO-8859-1">
        <style>
            ul.navbar-nav a:hover{
                color: white !important;

            }
            .question{
                display: flex;
                flex-direction: column;
                margin: 25px 50px;
                background-color: rgb(240, 240, 240);
                padding: 20px 40px;
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            }
            input[type="radio"]{
                margin-right: 20px;
            }
            .marks{
                float : right;
                text-align: right;
                display: inline;
            }
        </style>
      <script>
      <%
      Exam ex = ExamDao.GetExam();
      long duration = ex.getDuration();
      long examtime = ex.getTime().getTime();
      long curtime = new Date().getTime();
      long clock = duration*60 + (examtime - curtime)/1000;
      %>
      var timeout = <%= clock %>
      function timer()
      {
    	  if( timeout > 0)
    		  {
    		  timeout--;
                    document.forma.clock.value = Math.floor((timeout/60)) + " : " + (timeout%60);
                   
    		  window.setTimeout("timer()", 1000 );
                  
    		  }
    	  else
    		  {
    		  document.forma.clock.value ="Time Over";
    		  formb.submit();
    		  }
      }
      </script>


    </HEAD>
    <BODY onload="timer()">
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
              
        <form name="forma" action="<%=request.getRequestURL()%>">
            <div class="text-right pt-3"><h5><font>Time Left <input size="2" name="clock" id="fno" value="<%=(clock/60)%> : <%=(clock%60)%>" style="background: rgb(240, 240, 240)" readonly></font></h5></div>
        </form>
        <form action="Result.jsp" name="formb">
            <div class="text-center"><h3><font>Questions</font></h3></div>
            
        <%
           int i = 1;

           int radioname = 0;
           ArrayList<Questions> allQuestions = QuestionsDao.getAllRecords();
           for(Questions e : allQuestions)
           {   
                  %>

              <div class="question">
                  <div><p class="mb-0 w-75 d-inline"><%=i++%>.  <%=e.getQuestion() %></p> <p class="marks">Marks[<%=e.getMarks()%>]</p></div>
                  <input type="radio" value="e" name="<%=radioname%>" checked hidden>
                    <p><input type="radio" value="a" name="<%=radioname%>"><%=e.getA()%></p>
                    <p><input type="radio" value="b" name="<%=radioname%>"><%=e.getB()%></p>
                    <p><input type="radio" value="c" name="<%=radioname%>"><%=e.getC()%></p>
                    <p><input type="radio" value="d" name="<%=radioname%>"><%=e.getD()%></p>
              </div>
            <%
            radioname++;
            }
             %>
              <center><input class="btn btn-outline-success btn-lg" type="submit" value="submit"></center>
        </form>
    </BODY>
</HTML>