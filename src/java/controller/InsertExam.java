/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import db.Exam;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ExamDao;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Dell
 */
@WebServlet("/oes.controller.InsertExam")
public class InsertExam extends HttpServlet {

 	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertExam() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
            PrintWriter out = response.getWriter();
            response.setContentType("text/html");
		
            try {
                   Date time = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm").parse(request.getParameter("time"));
                   int duration = Integer.parseInt(request.getParameter("duration"));

                   Exam ex = new Exam();
                   ex.setTime(time);
                   ex.setDuration(duration);

                   boolean status = ExamDao.insertExam(ex);
                   if(status)
                   {
                           String msg1 = "Exam Added";
                   response.sendRedirect("ScheduleExam.jsp?msg1="+msg1);
                   }
                   else
                   {
                           String msg2 = "Exam not Added";
                   response.sendRedirect("ScheduleExam.jsp?msg2="+msg2);
                   }
                 
             } catch (ParseException ex){ 
                 String msg2 = "Exam not Added"+ex;
                   response.sendRedirect("ScheduleExam.jsp?msg2="+msg2);
             }
  	}


}
