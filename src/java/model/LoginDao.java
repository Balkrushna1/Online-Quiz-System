/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
import java.sql.*;  
import db.Login;
import db.Provider;


public class LoginDao {  
  
    public static boolean doValidate(Login bean, int admin){  
        boolean status=false;  
        try{  
             
            Connection con = Provider.getOracleConnection();
            
            String sql = (admin == 0)?"select * from studenttable where userid=? and password=?":"select * from admintable where userid=? and password=?";

            PreparedStatement ps=con.prepareStatement( sql );  

            ps.setString(1,bean.getUname());  
            ps.setString(2, bean.getPass());  

            ResultSet rs=ps.executeQuery();  
            if(rs.next())
            {
		bean.setName(rs.getString("name"));
		status = true;
            }
            else
            {
		status = false;
            } 

        }catch(Exception e){}  

        return status;  

    }  
}  