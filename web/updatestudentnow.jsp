<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
         <%@page import="model.StudentsDao"%>
<%@page import="db.Students"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	
<title>Insert title here</title>
<script type="text/javascript">
    function alertName(id){
        alert("Userid already exist. Enter unique userid.");
        window.location.href = "updatestudent.jsp?username=".concat(id);
    } 
</script> 
</head>
<body>
<%
		String newuserid = request.getParameter("uname");
                String newpassword = request.getParameter("pass");
                String newname = request.getParameter("name");
                String originaluid = request.getParameter("usernameoriginal");
		int status = StudentsDao.doUpdateNowRecord(originaluid,newuserid,newpassword,newname);
		if(status > 0)
		{ 
			response.sendRedirect("StudentList.jsp");
		}
		else if(status == -1)
		{
			
			out.print("error from databse");
			
		}
		else
		{%>
                    <script type="text/javascript"> alertName('<%= originaluid%>'); </script>
                    <%                        
                    
		}
		
	%>
</body>
</html>