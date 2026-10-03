package com.example.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class StudentDA {
	
	public Student insert(Student s) {

		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/stdb", "root", "nclc123456");
			PreparedStatement ps = con.prepareStatement("INSERT INTO student VALUES(?,?,?)");

			ps.setInt(1, s.getId());
			ps.setString(2, s.getName());
			ps.setInt(3, s.getRound());

			ps.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return s;
	}
}
