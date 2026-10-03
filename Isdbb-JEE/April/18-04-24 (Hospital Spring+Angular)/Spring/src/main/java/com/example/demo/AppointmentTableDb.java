package com.example.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AppointmentTableDb {
	public AppointmentTable save(AppointmentTable s) {

		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/hospital", "root", "nclc123456");
			PreparedStatement pst = con.prepareStatement("INSERT INTO appointmenttable VALUES(?,?,?,?,?,?,?,?)");
			pst.setInt(1, s.getA_id());
			pst.setString(2, s.getP_name());
			pst.setString(3, s.getDate());
			pst.setInt(4, s.getPhone());
			pst.setString(5, s.getProblem());
			pst.setString(6, s.getDept_name());
			pst.setString(7, s.getEmail());
			pst.setString(8, s.getD_id());
			pst.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return s;
	}

//	------------------------------- show data ------------------------------------------
	public List<AppointmentTable> allstudent() {
		List<AppointmentTable> slist = new ArrayList<>();
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/hospital", "root", "nclc123456");
			PreparedStatement pst = con.prepareStatement("select * from appointmenttable");
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				slist.add(new AppointmentTable(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4),
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8)));
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return slist;
	}

	public List<AppointmentTable> searchById(int id, String password) {
		List<AppointmentTable> slist = new ArrayList<>();
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/hospital", "root", "nclc123456");
			PreparedStatement pst1 = con.prepareStatement("select * from doctor where id=? AND password=?");
			pst1.setInt(1, id);
			pst1.setString(2, password);
			ResultSet rs1 = pst1.executeQuery();

			PreparedStatement pst;

			ResultSet rs=null;
			if (rs1.next()) {
				pst = con.prepareStatement("select * from appointmenttable where d_id=?");
				pst.setString(1, String.valueOf(id));
				rs = pst.executeQuery();
				
				while (rs.next()) {
					slist.add(new AppointmentTable(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4),
							rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8)));
				}
			}else {
				slist.clear();
				
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return slist;
	}

}
