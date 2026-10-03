package college;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Student {

    public static void main(String[] args) {
//        insertStudent();
//        queryStudent();
            searchByName();

    }
//  -----Insert Data Method-------
    public static void insertStudent() {
        try {
            Connection c1 = DriverManager.getConnection("jdbc:mysql://localhost/stdb", "root", "nclc123456");
            PreparedStatement p1 = c1.prepareStatement("INSERT INTO student(id,name,email)VALUES(105,'Fahim','fahim@gmail.com')");
            PreparedStatement p2 = c1.prepareStatement("INSERT INTO student(id,name,email)VALUES(106,'Sadik','sadik@gmail.com')");
            PreparedStatement p3 = c1.prepareStatement("INSERT INTO student(id,name,email)VALUES(107,'Minhaz','minhaz@gmail.com')");
            PreparedStatement p4 = c1.prepareStatement("INSERT INTO student(id,name,email)VALUES(108,'Imran','imran@gmail.com')");
            PreparedStatement p5 = c1.prepareStatement("INSERT INTO student(id,name,email)VALUES(109,'Dulal','dulal@gmail.com')");
            p1.executeUpdate();
            p2.executeUpdate();
            p3.executeUpdate();
            p4.executeUpdate();
            p5.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
    }
//  -----Update Data Method-------
    public static void updateStudent(){
        try {
            Connection c1 = DriverManager.getConnection("jdbc:mysql://localhost/stdb", "root", "nclc123456");
            PreparedStatement p1 = c1.prepareStatement("");
            p1.executeUpdate();
            
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    //  -----Delete Data Method-------
    static void deleteStudent(){
        try {
            Connection c1 = DriverManager.getConnection("jdbc:mysql://localhost/stdb", "root", "nclc123456");
            PreparedStatement p1 = c1.prepareStatement("INSERT INTO student(id,name,email)VALUES(102,'mahmud','sazid355@gmail.com')");
            p1.executeUpdate();
            
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    //  -----Query Data Method-------
    static void queryStudent() {
        try {
            Connection c1 = DriverManager.getConnection("jdbc:mysql://localhost/stdb", "root", "nclc123456");
            PreparedStatement p1 = c1.prepareStatement("SELECT * FROM student WHERE id>105");
            ResultSet rs = p1.executeQuery();
            while (rs.next()) {
                
                int studentId = rs.getInt(1);
                String studentName = rs.getString(2);
                String studentEmail = rs.getString(3);
                System.out.println("ID = "+studentId+" Name = "+studentName+ " Email = "+ studentEmail);
                
            }

        } catch (Exception e) {
            System.out.println(e);
        }
    }
//  -----Search By Name Method-------
    static void searchByName() {
        try {
            Connection c1 = DriverManager.getConnection("jdbc:mysql://localhost/stdb", "root", "nclc123456");
            PreparedStatement p1 = c1.prepareStatement("SELECT * FROM student WHERE name = 'Ridoy'");
            ResultSet rs = p1.executeQuery();
            while (rs.next()) {
                
                int studentId = rs.getInt(1);
                String studentName = rs.getString(2);
                String studentEmail = rs.getString(3);
                System.out.println("ID = "+studentId+" Name = "+studentName+ " Email = "+ studentEmail);
                
            }

        } catch (Exception e) {
            System.out.println(e);
        }
    }

}
