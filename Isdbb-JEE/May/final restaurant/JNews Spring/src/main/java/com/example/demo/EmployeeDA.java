package com.example.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Reserve;

public class EmployeeDA {

	public Employee save(Employee s) {

		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/good", "root", "sazid364436");
			PreparedStatement ps = con.prepareStatement("INSERT INTO employee VALUES(?,?,?,?)");
			
			ps.setInt(1, s.getEmp_id());
			ps.setString(2, s.getEmp_name());
			ps.setString(3, s.getEmp_email());
			ps.setString(4, s.getEmp_password());
			
			ps.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return s;
	}
//	------------------------------ log in -------------------------------------
	
	public Employee login(int id, String password) {
		Employee e =null;
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/good", "root", "sazid364436");
			PreparedStatement pst1 = con.prepareStatement("select * from employee where emp_id=? AND emp_password=?");
			pst1.setInt(1, id);
			pst1.setString(2, password);
			ResultSet rs = pst1.executeQuery();
			while (rs.next()) {
				e=new Employee(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4));
			}

		} catch (Exception ex) {
			// TODO: handle exception
		}

		return e;
	}
	
//	------------------------------ Show -------------------------------------
	public List<Employee> allEmployee(){
		List<Employee> eList = new ArrayList<>();
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/good", "root", "sazid364436");
			PreparedStatement pst = con.prepareStatement("select * from employee");
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				eList.add(new Employee(rs.getInt(1),rs.getString(2),rs.getNString(3),rs.getNString(4)));
			}
			
			
		}catch(Exception e) {
			
		}
		return eList;
		
	}
	
	
	//Search by id
	public Employee searchById(int emp_id){
		Employee e = null;
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/good", "root", "sazid364436");
			PreparedStatement pst = con.prepareStatement("select * from employee where emp_id =?");
			pst.setInt(1, emp_id);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				e = new Employee(rs.getInt(1),rs.getString(2),rs.getNString(3),rs.getNString(4));
			}
			
			
		}catch(Exception ex) {
			
		}
		return e;
		
	}
	
	//Employee Update
	
	public Employee empUpdate(Employee s) {
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/good", "root", "sazid364436");
			PreparedStatement pst = con.prepareStatement("UPDATE employee SET emp_name = ?, emp_email = ?, emp_password = ? WHERE emp_id = ?");
			pst.setString(1, s.emp_name);
			pst.setString(2, s.emp_email);
			pst.setString(3, s.emp_password);
			pst.setInt(4, s.emp_id);
			
			pst.executeUpdate();
			
			
		}catch (Exception ex){
			
		}
		return s;
	}
	
	//Employee Delete
	
	public Employee empDelete(Employee s) {
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/good", "root", "sazid364436");
			PreparedStatement pst = con.prepareStatement("DELETE FROM employee where emp_id = ?");
			pst.setInt(1, s.getEmp_id());
			pst.executeUpdate();
			
		}catch(Exception e) {
			
		}
		return s;
	}
	
	
	
	
//	News Post
	public News saveNews(News n) {

		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/good", "root", "sazid364436");
			PreparedStatement ps = con.prepareStatement("INSERT INTO news VALUES(?,?,?,?,?,?,?)");
			
			
			ps.setInt(1, n.getNews_id());
			ps.setString(2, n.getWriter());
			ps.setString(3, n.getTitle());
			ps.setString(4, n.getDescription());
			ps.setString(5, n.getPubl_date());
			ps.setString(6, n.getImage());
			ps.setString(7, n.getCategory());
			
			ps.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return n;
	}
	
	
//	show News
	
	public List<News> allNews(){
		List<News> eList = new ArrayList<>();
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/good", "root", "sazid364436");
			PreparedStatement pst = con.prepareStatement("select * from news ORDER BY news_id DESC");
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				eList.add(new News(rs.getInt(1),rs.getString(2),rs.getNString(3),rs.getNString(4),rs.getNString(5),rs.getNString(6),rs.getString(7)));
			}
			
			
		}catch(Exception e) {
			
		}
		return eList;
		
	}
	
	//News Search
		public News searchNewsById(int news_id){
			News e = null;
			try {
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost/good", "root", "sazid364436");
				PreparedStatement pst = con.prepareStatement("select * from news where news_id =?");
				pst.setInt(1, news_id);
				ResultSet rs = pst.executeQuery();
				while(rs.next()) {
					e = new News(rs.getInt(1),rs.getString(2),rs.getNString(3),rs.getNString(4),rs.getNString(5),rs.getNString(6),rs.getNString(7));
				}
				
				
			}catch(Exception ex) {
				
			}
			return e;
			
		}
	
	
	
	
	
	
	
	//reserve table
	public Reserve reserveTable(Reserve r) {

		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/good", "root", "sazid364436");
			PreparedStatement ps = con.prepareStatement("INSERT INTO reservation VALUES(?,?,?,?,?,?,?,?,?,?,?)");
			
			ps.setInt(1, r.getBook_id());
			ps.setString(2, r.getBook_name());
			ps.setString(3, r.getBook_email());
			ps.setString(4, r.getBook_phone());
			ps.setString(5, r.getBook_guest());
			ps.setString(6, r.getBook_date());
			ps.setString(7, r.getBook_time());
			ps.setString(8, r.getBook_message());
			ps.setString(9, r.getBook_status());
			ps.setString(10, r.getBook_amount());
			ps.setString(11, r.getBook_tnxid());
			
			ps.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return r;
	}
	
//	show Reservesion
	
	public List<Reserve> allBooking(){
		List<Reserve> eList = new ArrayList<>();
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/good", "root", "sazid364436");
			PreparedStatement pst = con.prepareStatement("select * from reservation WHERE book_status='1' ORDER BY book_id DESC");
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				eList.add(new Reserve(rs.getInt(1),rs.getString(2),rs.getNString(3),rs.getNString(4),rs.getNString(5),rs.getNString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11)));
			}
			
			
		}catch(Exception e) {
			
		}
		return eList;
		
	}
	
	
	//reservation Search by id
		public Reserve resSearchById(int book_id){
			Reserve e = null;
			try {
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost/good", "root", "sazid364436");
				PreparedStatement pst = con.prepareStatement("select * from reservation where book_id =?");
				pst.setInt(1, book_id);
				ResultSet rs = pst.executeQuery();
				while(rs.next()) {
					e = new Reserve(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11));
				}
				
				
			}catch(Exception ex) {
				
			}
			return e;
			
		}
	
	
	
	
	
}
