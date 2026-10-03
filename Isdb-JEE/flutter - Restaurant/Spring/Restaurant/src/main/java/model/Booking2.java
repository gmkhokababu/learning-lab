package model;

import java.sql.Date;

public class Booking2 {
	int bookingId;
	int tableNo;
	int customerId;
	String bookingTime;
	String bookingStatus;
	String date;
	int orderId;
	String customerName;
	String phone;
	
	
	public Booking2() {
		super();
	}


	public Booking2(int bookingId, int tableNo, int customerId, String bookingTime, String bookingStatus, String date,
			int orderId) {
		super();
		this.bookingId = bookingId;
		this.tableNo = tableNo;
		this.customerId = customerId;
		this.bookingTime = bookingTime;
		this.bookingStatus = bookingStatus;
		this.date = date;
		this.orderId = orderId;
	}
	
	


	public Booking2(int bookingId, int tableNo, int customerId, String bookingTime, String bookingStatus, String date,
			int orderId, String customerName, String phone) {
		super();
		this.bookingId = bookingId;
		this.tableNo = tableNo;
		this.customerId = customerId;
		this.bookingTime = bookingTime;
		this.bookingStatus = bookingStatus;
		this.date = date;
		this.orderId = orderId;
		this.customerName = customerName;
		this.phone = phone;
	}


	public int getBookingId() {
		return bookingId;
	}


	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}


	public int getTableNo() {
		return tableNo;
	}


	public void setTableNo(int tableNo) {
		this.tableNo = tableNo;
	}


	public int getCustomerId() {
		return customerId;
	}


	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}


	public String getBookingTime() {
		return bookingTime;
	}


	public void setBookingTime(String bookingTime) {
		this.bookingTime = bookingTime;
	}


	public String getBookingStatus() {
		return bookingStatus;
	}


	public void setBookingStatus(String bookingStatus) {
		this.bookingStatus = bookingStatus;
	}


	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}


	public int getOrderId() {
		return orderId;
	}


	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	


	public String getCustomerName() {
		return customerName;
	}


	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	
	


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	@Override
	public String toString() {
		return "Booking [bookingId=" + bookingId + ", tableNo=" + tableNo + ", customerId=" + customerId
				+ ", bookingTime=" + bookingTime + ", bookingStatus=" + bookingStatus + ", date=" + date + ", orderId="
				+ orderId + ", customerName=" + customerName + ", phone=" + phone + ", getBookingId()=" + getBookingId()
				+ ", getTableNo()=" + getTableNo() + ", getCustomerId()=" + getCustomerId() + ", getBookingTime()="
				+ getBookingTime() + ", getBookingStatus()=" + getBookingStatus() + ", getDate()=" + getDate()
				+ ", getOrderId()=" + getOrderId() + ", getCustomerName()=" + getCustomerName() + ", getPhone()="
				+ getPhone() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}


	


	
	
	
}
