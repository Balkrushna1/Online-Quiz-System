package db;
import java.sql.Connection;
import java.sql.DriverManager;

public class Provider {
	
	public static Connection getOracleConnection()
	{
		Connection con = null;
		try
		{ 
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_exam_system","java","java");
					
		}
		catch (Exception e) {
			
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return con;
	}
}
	