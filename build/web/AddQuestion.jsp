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
    <title>Add Question</title>
</head>
<body>
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <a class="navbar-brand" href="Home.jsp"><strong>Quick Quizzz</strong></a>
        <ul class="navbar-nav">
          <li class="nav-item"> <a class="nav-link" href="AdminPanel.jsp">Admin Panel</a></li>
          <li class="nav-item"> <a class="nav-link" href="StudentList.jsp">Manage Student</a></li>
          <li class="nav-item"> <a class="nav-link" href="InstructionList.jsp">Manage Instruction</a></li>
          <li class="nav-item"> <a class="nav-link active" href="QuestionList.jsp">Manage Questions</a></li>
          <li class="nav-item"> <a class="nav-link" href="ScheduleExam.jsp">Manage Exam</a></li>

        </ul>
        <ul class="navbar-nav ml-auto">
          <li class="nav-item"><a class="nav-link" href="AdminPanel.jsp"><i class="fas fa-user"></i> <%out.println(session.getAttribute("username")); %></a></li>
          <li class="nav-item"><a class="nav-link" href="oes.controller.LogoutAdmin"><i class="fas fa-sign-out-alt"></i>Logout</a></li>
        </ul>
    </nav>
          
    <div class="container">                
        <h2 style="text-align: center; padding-top: 15px"> <font  color ="black">Enter Question Here</font></h2>
        <div class="row mt-4">
            <form action="oes.controller.QuestionInsert">                
                Question:    <input class="form-control" type="text" name="Question">

                Option A:     <input class="form-control" type="text" name="option1">

                Option B:     <input class="form-control" type="text" name="option2">

                Option C:     <input class="form-control" type="text" name="option3">

                Option D:     <input class="form-control" type="text" name="option4">
                
                Answer:     <select class="form-control" name="answer">
                                <option value="a">a</option>
                                <option value="b">b</option>
                                <option value="c">c</option>
                                <option value="d">d</option>
                            </select>
                Marks:     <input class="form-control" type="number" name="marks"><br>
                <input type="submit" value="Done" class="btn btn-outline-primary"><br>
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
                </div>
            </form>
        </div>  
    </div>
</body>
</html>