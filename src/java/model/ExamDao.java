/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import db.Exam;
import db.Provider;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
/**
 *
 * @author Dell
 */
public class ExamDao {
    
    public static boolean insertExam(Exam ex) {
		// TODO Auto-generated method stub
		boolean status = false;
		try
		{
		
		Connection con = Provider.getOracleConnection();
		String sql = "insert into examtable values(?,?)";
		PreparedStatement pst = con.prepareStatement(sql);
                String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(ex.getTime());  
		pst.setString(1,date);
                pst.setInt(2,ex.getDuration());

		int val = pst.executeUpdate();
		if(val > 0)
		{
			status = true;
		}
		else
		{
			status = false;
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return status;
	}
   
    public static Exam GetExam() {
        
                Exam ex = null;
		try
		{
		
                    Connection con = Provider.getOracleConnection();
                    String sql = "Select * FROM examtable";
                    Statement pst = con.createStatement();

                    ResultSet rs = pst.executeQuery(sql);
                    long curtime = new Date().getTime();
                    long min = Integer.MAX_VALUE;
                    while(rs.next())
                    {
                              Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rs.getString(1));
                              int duration = Integer.parseInt(rs.getString(2));
                              if((date.getTime()+ duration*60*1000) >= curtime ){
                                    
                                    if(min > (date.getTime()+ duration*60*1000)-curtime){
                                        ex = new Exam();
                                        ex.setTime(date);
                                        ex.setDuration(duration);
                                        min = (date.getTime()+ duration*60*1000)-curtime;
                                    }
                              }
                    }
                }
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return ex;
	}
    
}
