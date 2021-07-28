<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page import="model.LoginDao"%>  
<jsp:useBean id="obj" class="db.Login"/>  
  
<jsp:setProperty property="*" name="obj"/>  
<c:set var="isAdmin" value="isAdmin" />
<%boolean status; %>
<c:choose>
  <c:when test="${param.isAdmin eq 'yes'}">
    <%
        status = LoginDao.doValidate(obj, 1);  
        if(status)
	    {
	    	HttpSession adminsession = request.getSession();
                adminsession.setMaxInactiveInterval(30*60);
                adminsession.setAttribute("role", "admin");
                adminsession.setAttribute("username", obj.getUname());
                adminsession.setAttribute("name",obj.getName() );
		response.sendRedirect("AdminPanel.jsp");
	    }
	    else
	    {
	    	String msg2 = "Invalid Admin Username or Password !";
	    	response.sendRedirect("index.jsp?msg2="+msg2);
	    }
    %>
  </c:when>
  <c:otherwise>
    <%
        status = LoginDao.doValidate(obj, 0);  
        if(status)
        {
            //Logged in  as student do something (pending)
            HttpSession studentsession = request.getSession();
            studentsession.setMaxInactiveInterval(30*60);
            studentsession.setAttribute("role", "student");
            studentsession.setAttribute("username", obj.getUname());
            studentsession.setAttribute("name",obj.getName() );
            response.sendRedirect("Home.jsp");

        }
        else
        {
            String msg = "Invalid Student Username or Password !";
            response.sendRedirect("index.jsp?msg="+msg);
        }
    %>
  </c:otherwise>
</c:choose>
