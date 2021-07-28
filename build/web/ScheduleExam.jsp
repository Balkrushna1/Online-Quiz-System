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
        .row{
            display: flex;
            width:100%;
            justify-content: center;
            align-items: center;
        }
        form{
            width: 500px;
            background-color:  rgb(240, 240, 240);
            padding: 30px 20px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }
    </style>
    <title>Schedule Exam</title>
</head>
<body>
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <a class="navbar-brand" href="Home.jsp"><strong>Quick Quizzz</strong></a>
        <ul class="navbar-nav">
          <li class="nav-item"> <a class="nav-link" href="AdminPanel.jsp">Admin Panel</a></li>
          <li class="nav-item"> <a class="nav-link" href="StudentList.jsp">Manage Student</a></li>
          <li class="nav-item"> <a class="nav-link" href="InstructionList.jsp">Manage Instruction</a></li>
          <li class="nav-item"> <a class="nav-link" href="QuestionList.jsp">Manage Questions</a></li>
          <li class="nav-item"> <a class="nav-link active" href="ScheduleExam.jsp">Manage Exam</a></li>

        </ul>
        <ul class="navbar-nav ml-auto">
          <li class="nav-item"><a class="nav-link" href="AdminPanel.jsp"><i class="fas fa-user"></i> <%out.println(session.getAttribute("username")); %></a></li>
          <li class="nav-item"><a class="nav-link" href="oes.controller.LogoutAdmin"><i class="fas fa-sign-out-alt"></i>Logout</a></li>
        </ul>
    </nav>
          
    <div class="container">                
        <h2 style="text-align: center; padding-top: 35px"> <font  color ="black">Enter Exam Details</font></h2>
        <div class="row mt-4">
            <form action="oes.controller.InsertExam">
                Date and Time          :      <input class="form-control" type="datetime-local" name="time"><br>

                Exam Duration [in min] :      <input class="form-control" type="number" name="duration"><br>
                
                <input type="submit" value="Schedule" class="btn btn-outline-primary"><br><br>
                <div>
                    <font color="red" >
                    <%
                            if(request.getParameter("msg2") != null)
                                    out.print(request.getParameter("msg2"));
                    %>
                    </font>
                            <font color="green" >
                    <%
                            if(request.getParameter("msg1") != null)
                                    out.print(request.getParameter("msg1"));
                    %>
                    </font>
                </div><br>
            </form>
        </div>  
    </div>
</body>
</html>