<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isErrorPage = "true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="ISO-8859-1">
      <title>Show Error Page</title>
   </head>
   
   <body style="text-align: center">
        <h1>Opps...</h1>
        <% if(response.getStatus() == 500){ %>
        <font color="red">Error: <%=exception.getMessage() %></font><br>

        <%-- include login page --%>
        <%@ include file="index.jsp"%>
        <%}else {%>
        <h3>
            Hi There, <br>
            Error occured : Error code is <%=response.getStatus() %><br>
            Please go to <a href="/exam_system_2/index.jsp">home page</a>
        </h3>
        <%} %>
   </body>
</html>