
package com.tech.blog.helper;
import java.sql.*;

/**
 *
 * @author hp
 */
public class ConnectionProvider {
    private static Connection con;
    
    public static Connection getConnection() throws Exception{
        try{
           
            if(con == null){
                Class.forName("com.mysql.jdbc.Driver");
            //create a connection
                con= DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog", "root", "Anubhav@7621");
                
                
            }
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return con;
    }
}
