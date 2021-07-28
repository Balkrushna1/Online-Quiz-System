<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
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
            height: 85vh;
            width:100%;
            justify-content: center;
            align-items: center;
        }
        form{
            width: 400px;
            background-color:  rgb(240, 240, 240);
            padding: 30px 20px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }
    </style>
<title>Student Login</title>

</head>
<body>                
    <%
        if(session.getAttribute("username")!=null){
            if(session.getAttribute("role")=="student")
                response.sendRedirect("Home.jsp");
            else if(session.getAttribute("role")=="admin")
                response.sendRedirect("AdminPanel.jsp");
        }
    %>
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <a class="navbar-brand" href="Home.jsp"><strong>Quick Quizzz</strong></a>
        <ul class="navbar-nav">
          <li class="nav-item"> <a class="nav-link" href="Home.jsp">Home</a></li>
          <li class="nav-item"> <a class="nav-link" href="StudentInstructions.jsp">Test</a></li>

        </ul>
        <ul class="navbar-nav ml-auto">
          <li class="nav-item"><a class="nav-link active" href="index.jsp"><i class="fas fa-sign-in-alt"></i> Log In</a></li>
        </ul>
    </nav>
    
    <div class="container">                
        <div class="row">
            <form action="loginprocess.jsp" method="post">
                <div class="text-center">
                    <font color="red" >
                    <%
                            if(request.getParameter("msg") != null)
                                    out.print(request.getParameter("msg"));
                    %>
                    </font>
                    <font color="green" >
                    <%
                            if(request.getParameter("msg1") != null)
                                    out.print(request.getParameter("msg1"));
                    %> 
                    </font>
                    <br><br>
                </div>
                <div class="form-group">
                  <label for="username">Username:</label>
                  <input type="username" class="form-control" id="username" name="uname">
                </div>
                <div class="form-group">
                  <label for="pwd">Password:</label>
                  <input type="password" class="form-control" id="pwd" name="pass">
                </div>
                <div class="checkbox">
                    <label><input type="checkbox" name="isAdmin" value="yes"> Admin / Faculty</label>
                </div>
                <button type="submit" class="btn btn-success">Log In</button>
            </form><br><br><br><br><br>


        </div>

    </div>                
	
</body>
</html>