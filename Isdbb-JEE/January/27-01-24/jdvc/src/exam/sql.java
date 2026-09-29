package exam;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class sql {

    public static void main(String[] args) {
//        insertStudent();
//        updateStudent();
//        deleteStudent();
        showStudent();

    }

    public static void insertStudent() {
        try {
            Connection c1 = DriverManager.getConnection("jdbc:mysql://localhost/stdb", "root", "nclc123456");
            PreparedStatement p1 = c1.prepareStatement("INSERT INTO student(id,name,email)VALUES(110,'Iqbal','iqbal@gmail.com')");
            p1.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public static void updateStudent() {
        try {
            Connection c1 = DriverManager.getConnection("jdbc:mysql://localhost/stdb", "root", "nclc123456");
            PreparedStatement p1 = c1.prepareStatement("UPDATE student SET name = 'Sajib' WHERE id = 110;");
            p1.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public static void deleteStudent() {
        try {
            Connection c1 = DriverManager.getConnection("jdbc:mysql://localhost/stdb", "root", "nclc123456");
            PreparedStatement p1 = c1.prepareStatement("DELETE FROM student WHERE name='Fahim'");
            p1.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public static void showStudent() {
       try {
            Connection c1 = DriverManager.getConnection("jdbc:mysql://localhost/stdb", "root", "nclc123456");
            PreparedStatement p1 = c1.prepareStatement("SELECT * FROM student WHERE id>105");
            ResultSet rs = p1.executeQuery();
            

        } catch (Exception e) {
            System.out.println(e);
        }
    }

}
