<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
          <%@page import="model.*"%>
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
    <title>Update Question</title>
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
    <h2 style="text-align: center; padding-top: 35px"> <font  color ="black">List of Questions</font></h2>
   
    <table class="table table-bordered table-hover">
        <tr class="table-dark">
            <th>sl no.</th>
            <th>Question</th>
            <th>Option A </th>
            <th>Option B </th>
            <th>Option C </th>
            <th>Option D </th>
            <th>Correct Answer</th>
            <th>Marks </th>
            <th>Update</th>
            <th>Delete</th>
        </tr>
    <%
       int i = 0;
       ArrayList<Questions> allQuestions = QuestionsDao.getAllRecords();
      for(Questions e : allQuestions)
      {  if(request.getParameter("ques").equals(e.getQuestion())) 
            {
          %>
            <tr  class="table-primary">
                <form action="updatequestionnow.jsp">
                    <input type="hidden" value="<%=e.getQuestion()%>" type="text" name="quesoriginal">
                    <td><%=i++%></td>
                    <td> <input type="text" value="<%=e.getQuestion()%>" name="quesmodified"></input> </td>
                    <td> <input type="text" value=<%=e.getA() %> name="opta" size="15"></input>  </td>
                    <td> <input type="text" value=<%=e.getB() %> name="optb" size="15" ></input>  </td>
                    <td> <input type="text" value=<%=e.getC() %> name="optc" size="15"></input>  </td>
                    <td> <input type="text" value=<%=e.getD() %> name="optd" size="15" ></input>  </td>
                    <td> <select class="form-control" name="ans">
                                <option value="a">a</option>
                                <option value="b">b</option>
                                <option value="c">c</option>
                                <option value="d">d</option>
                         </select>
                    </td>
                    <td> <input type="text" value=<%=e.getMarks() %> name="marks" size="5"></input>  </td>
                    <td><button type="submit" class="btn btn-success">Update</button></td>
                    <td><a href="deletequestion.jsp?ques=<%=e.getQuestion()%>">Delete</a></td>
                </form>
            </tr>
        <%	
            }
            else
            { 
            %>   
        <tr>
            <td><%=i++%></td>
            <td><%=e.getQuestion() %></td>
            <td><%=e.getA()%></td>
            <td><%=e.getB()%></td>
            <td><%=e.getC()%></td>
            <td><%=e.getD()%></td>
            <td><%=e.getAnswer()%></td>
            <td><%=e.getMarks()%></td>
            <td><a href="updatequestion.jsp?ques=<%=e.getQuestion()%>">Update</a></td>
            <td><a href="deletequestion.jsp?ques=<%=e.getQuestion()%>">Delete</a></td>
        </tr>
      <%
      }
      }
      %>
        <tr>
            <th colspan="10"><center><input type="button" class="btn btn-outline-success" value="Add Question" onclick="location.href='AddQuestion.jsp'"></center></th>
        </tr>
    </table>
</body>
</html>