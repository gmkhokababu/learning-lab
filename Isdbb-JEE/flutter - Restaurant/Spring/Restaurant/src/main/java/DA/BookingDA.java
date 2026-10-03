package DA;

import java.sql.*;
import java.sql.Date;
import java.util.*;

import model.Booking;
import model.Booking2;

public class BookingDA extends MysqlConnection{

	public void addBooking(Booking b) {
		String addBookingStatement = "insert into booking(tableNo,customerId,bookingTime,date,orderId,customerName,phone) values(?,?,?,?,?,?,?)";
		try {
			
			con = DriverManager.getConnection(url,user,pass);
			ps = con.prepareStatement(addBookingStatement);
		
			ps.setInt(1, b.getTableNo());
			ps.setInt(2, b.getCustomerId());
			ps.setString(3, b.getBookingTime());
			ps.setDate(4, b.getDate());
			ps.setInt(5, b.getOrderId());
			ps.setString(6, b.getCustomerName());
			ps.setString(7, b.getPhone());
			
			
			
			
			
			ps.executeUpdate();

			ps.close();
		}catch(Exception e){
			System.out.println(e);
		}
	}
	
	public void addBooking2(Booking2 b) {
		String addBookingStatement = "insert into booking(tableNo,customerId,bookingTime,bookingStatus,date,orderId,customerName,phone) values(?,?,?,?,?,?,?,?)";
		try {
			
			con = DriverManager.getConnection(url,user,pass);
			ps = con.prepareStatement(addBookingStatement);
		
			ps.setInt(1, b.getTableNo());
			ps.setInt(2, b.getCustomerId());
			ps.setString(3, b.getBookingTime());
			ps.setString(4, b.getBookingStatus());
			ps.setString(5, b.getDate());
			ps.setInt(6, b.getOrderId());
			ps.setString(7, b.getCustomerName());
			ps.setString(8, b.getPhone());
			
			
			
			
			
			ps.executeUpdate();

			ps.close();
		}catch(Exception e){
			System.out.println(e);
		}
	}
	
	
	List<Booking> allbookeddata = new ArrayList<>();
	public List<Booking> allbookeddata(Date d, String status){
		String bookedTableStatement = "select * from booking where date=? and bookingStatus=?";
		try {
			con = DriverManager.getConnection(url,user,pass);
			ps = con.prepareStatement(bookedTableStatement);
			ps.setDate(1, d);	
			ps.setString(2, status);
			rs=ps.executeQuery();
			while(rs.next()) {
				allbookeddata.add(new Booking(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getDate(6),rs.getInt(7)));
			}
			

			ps.close();
		}catch(Exception e){
			System.out.println(e);
		}
		
		return allbookeddata;
	}
	
	List<Booking> allbooked = new ArrayList<>();
	public List<Booking> allbooked(){
		String bookedTableStatement = "select * from booking Order by bookingId Desc";
		try {
			con = DriverManager.getConnection(url,user,pass);
			ps = con.prepareStatement(bookedTableStatement);
				
			rs=ps.executeQuery();
			while(rs.next()) {
				allbookeddata.add(new Booking(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getDate(6),rs.getInt(7),rs.getString(8),rs.getString(9)));
			}
			

			ps.close();
		}catch(Exception e){
			System.out.println(e);
		}
		
		return allbookeddata;
	}
	
	
	
	public void updateCheckOutBooking(int bookingId) {
		String addBookingStatement = "update booking set bookingStatus='check out' where bookingId=?";
		try {
			
			con = DriverManager.getConnection(url,user,pass);
			ps = con.prepareStatement(addBookingStatement);
		
			ps.setInt(1, bookingId);
			
			ps.executeUpdate();

			ps.close();
		}catch(Exception e){
			System.out.println(e);
		}
	}
	
	
	Booking bookeddatabyId;
	public Booking allbookeddata(int id){
		String bookedTableStatement = "select * from booking where bookingId=?";
		try {
			con = DriverManager.getConnection(url,user,pass);
			ps = con.prepareStatement(bookedTableStatement);
			ps.setInt(1, id);	
			
			rs=ps.executeQuery();
			while(rs.next()) {
				bookeddatabyId=new Booking(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getDate(6),rs.getInt(7));
			}
			

			ps.close();
		}catch(Exception e){
			System.out.println(e);
		}
		
		return bookeddatabyId;
	}
	
}
