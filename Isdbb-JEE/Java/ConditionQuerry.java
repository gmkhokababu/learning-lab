package com.exam;

import java.sql.*;
import java.sql.DriverManager;
import java.util.Scanner;

public class ConditionQuerry {

    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost/stdp";
        String user = "root";
        String pass = "nclc123456";
        Scanner input = new Scanner(System.in);
        System.out.println("Input ID");
        int x = input.nextInt();
        try {
            Connection con = DriverManager.getConnection(url, user, pass);
            PreparedStatement ps = con.prepareStatement("SELECT * FROM student WHERE id=?");
            ps.setInt(1, x);
           ResultSet rs= ps.executeQuery();
           
           while(rs.next()){
               int y=rs.getInt(1);
               String z=rs.getString(2);
               System.out.println(y+"\t"+z);
           }
            
        } catch (Exception e) {
            System.out.println(e);
        }

    }
}
