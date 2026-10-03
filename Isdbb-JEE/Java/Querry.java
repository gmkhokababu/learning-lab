
package com.exam;

import java.sql.*;
import java.sql.DriverManager;


public class Querry {
    public static void main(String[] args) {
        String url="jdbc:mysql://localhost/shop";
        String user="root";
        String pass="nclc123456";
        
        try{
            Connection con =DriverManager.getConnection(url,user,pass);
            PreparedStatement ps=con.prepareStatement("SELECT * FROM product");
            ResultSet rs=ps.executeQuery();
            //System.out.println("Product Id");
            while (rs.next()) {
                int id=rs.getInt(1);
                String name=rs.getString(2);
                Double price=rs.getDouble(3);
                String size=rs.getString(4);
                int stock=rs.getInt(5);
                String e_date=rs.getString(6);
                System.out.println(id+"\t"+name+"\t"+price+"\t"+size+"\t"+stock+"\t"+e_date);
                
            }
        }catch(Exception e){
            System.out.println(e);
        }
    }
}
