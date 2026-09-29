
package com.exam;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

@ManagedBean
@SessionScoped
public class Student {
    int id;
    String name;
    String email;
    String password;

    public Student() {
    }

    public Student(int id, String name, String email, String password) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public String signup() {
        String ret = "fail.xhtml";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stdb", "root", "nclc123456");
            PreparedStatement ps = con.prepareStatement("INSERT INTO student(id,name,email,password)VALUES(?,?,?,?)");
            ps.setInt(1, this.id);
            ps.setString(2, this.name);
            ps.setString(3, this.email);
            ps.setString(4, this.password);
            ps.executeUpdate();

        } catch (Exception ex) {
            System.out.println(ex);
        }

        return "login";
    }
    
    public String login() {

        String ret = "fail.xhtml";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stdb", "root", "nclc123456");
            PreparedStatement ps = con.prepareStatement("SELECT * FROM student WHERE email=? AND password=?");
            ps.setString(1, this.email);
            ps.setString(2, this.password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                 this.name=rs.getString(2);
                ret = "success.xhtml";
            }
            ps.close();

        } catch (Exception ex) {
            System.out.println(ex);
        }

        return ret;
    }
    
    
}
