package com.example.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class EmployeeDA {
	public Employee login(int id, String password) {
		Employee e =null;
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/good", "root", "nclc123456");
			PreparedStatement pst1 = con.prepareStatement("select * from employee where emp_id=? AND emp_password=?");
			pst1.setInt(1, id);
			pst1.setString(2, password);
			ResultSet rs = pst1.executeQuery();
			while (rs.next()) {
				e=new Employee(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4)); // e ke controller e pathabe
			}

		} catch (Exception ex) {
			// TODO: handle exception
		}

		return e;
	}
}
