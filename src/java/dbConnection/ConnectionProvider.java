/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author namee
 */
package dbConnection;
import java.io.*;
import java.util.*;
import java.sql.*;
public class ConnectionProvider {
    private  String db_Host="localhost";
    private  String db_Port="3306";
    private  String db_Username="root";
    private  String db_Password="";
    private  String db_Name="tech_trade_db";
        
        public  Connection getCon() {
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://" + db_Host + ":" + db_Port + "/" + db_Name + "",db_Username,db_Password);
			return con;
		}
		catch(Exception e)
		{
			System.out.println(e);
			return null;
		}
		
	}
    
}
