<%@page import="model.QuestionsDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%      
        String OriginalQuestion = request.getParameter("quesoriginal");
		String newQuestion = request.getParameter("quesmodified");
        String opta = request.getParameter("opta");
        String optb = request.getParameter("optb");
        String optc = request.getParameter("optc");
        String optd = request.getParameter("optd");
        String ans = request.getParameter("ans");
        String marks = request.getParameter("marks");
		int status =QuestionsDao.doUpdateNowRecord(OriginalQuestion,newQuestion,opta,optb,optc,optd,ans,marks);
		if(status > 0)
		{
			response.sendRedirect("QuestionList.jsp");
		}
		else if(status == -1)
		{
			out.print("error from databse");
			
		}
		else
		{
			out.print("excepion occured");
		}
		
	%>
</body>
</html>