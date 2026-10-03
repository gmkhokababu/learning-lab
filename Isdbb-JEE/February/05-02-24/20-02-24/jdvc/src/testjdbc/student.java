package testjdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class student {
    public static void main(String[] args) {
//        insertStudent();
//        updateStudent();
//        deleteStudent();

        searchStudent();
    }
//    -----------Insert--------------
    public static void insertStudent(){
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/stdb", "root", "nclc123456");
            PreparedStatement p1 = con.prepareStatement("INSERT INTO student2 (id,name,round) Values (107,'Shahid',50)");
            p1.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
//     -----------Update--------------
    
    public static void updateStudent(){
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/stdb", "root", "nclc123456");
            PreparedStatement p1 = con.prepareStatement("Update student2 SET name ='Rafiq' WHERE id=107");
            p1.executeUpdate();
            
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }

//     -----------Delete--------------
    public static void deleteStudent(){
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/stdb", "root", "nclc123456");
            PreparedStatement p1 = con.prepareStatement("DELETE FROM student2 WHERE id=106");
            p1.executeUpdate();
            
        } catch (Exception e) {
        }
    }
    
    //     -----------Read--------------
    public static void searchStudent(){
        try {
             Connection con = DriverManager.getConnection("jdbc:mysql://localhost/stdb", "root", "nclc123456");
             PreparedStatement p1 = con.prepareStatement("SELECT * FROM student2 WHERE id=103");
            ResultSet rs = p1.executeQuery();
             
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                int round = rs.getInt(3);
                
                System.out.println("Id = "+ id +" Name = " + name + " Batch = "+ round);
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    
}
