package com.exam;

import java.sql. *;
import java.sql.DriverManager;
import java.util.Scanner;

public class DataBasePractice {

    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost/shop";
        String user = "root";
        String pass = "nclc123456";
        int id=0;
        String name="";
        double price=0;
        String size="";
        int stock=0;
        String exDate="";
        Scanner input=new Scanner(System.in);
        System.out.println("Input Product ID");
        id=input.nextInt();
        System.out.println("Input Product Name");
        input.nextLine();
        name=input.nextLine();
        System.out.println("Input Product Price");
        price=input.nextDouble();
        System.out.println("Input Product Size");
        input.nextLine();
        size=input.nextLine();
        System.out.println("Input Product Quantity");
        stock=input.nextInt();
        System.out.println("Input Product Expair Date");
        input.nextLine();
        exDate=input.nextLine();
        try{
            Connection con=DriverManager.getConnection(url,user,pass);
            PreparedStatement ps=con.prepareStatement("INSERT INTO product(p_id,p_name,p_price,p_size,p_stock,p_exdate) values(?,?,?,?,?,?)");
            ps.setInt(1,id);
            ps.setString(2, name);
            ps.setDouble(3, price);
            ps.setString(4, size);
            ps.setInt(5,stock);
            ps.setString(6, exDate);
            ps.executeUpdate();
            System.out.println("success");
        }catch(Exception e){
        System.out.println(e);
    }
    }

}
