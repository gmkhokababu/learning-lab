
package com.exam;

import java.sql.*;



public class StudentDataInput {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost/stdp";
        String user = "root";
        String pass = "nclc123456";
        try{
            Connection con=DriverManager.getConnection(url,user,pass);
            PreparedStatement ps=con.prepareStatement("INSERT INTO student(user_id,password) VALUES(100,'abu123')");
            ps.executeUpdate();
            System.out.println("success");
            
            
        }catch(Exception e){
            System.out.println(e);
        }
    }
}
