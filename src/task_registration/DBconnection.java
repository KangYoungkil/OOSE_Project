package task_registration;
import java.sql.*;

public class DBconnection
{
	public Connection getConnection()
	{
		Connection con = null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");

			String DB_URL = "jdbc:mysql://localhost:3306/ResearchMasterDatabase"
						  + "?useUnicode=true&characterEncoding=UTF-8";
			String DB_USER = "root";
			String DB_PASSWORD = "apmsetup";
			con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return con;
	}
}
