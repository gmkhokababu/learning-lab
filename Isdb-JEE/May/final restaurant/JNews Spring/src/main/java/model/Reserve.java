package model;

public class Reserve {
	
	
	
//	book_id, book_name, book_email, book_phone, book_guest, 
//	book_date, book_time, book_message, book_status
	
	int book_id;
	String book_name;
	String book_email;
	String book_phone;
	String book_guest;
	String book_date;
	String book_time;
	String book_message;
	String book_status;
	String book_amount;
	String book_tnxid;
	public Reserve() {
		super();
	}
	public Reserve(int book_id, String book_name, String book_email, String book_phone, String book_guest,
			String book_date, String book_time, String book_message, String book_status, String book_amount,
			String book_tnxid) {
		super();
		this.book_id = book_id;
		this.book_name = book_name;
		this.book_email = book_email;
		this.book_phone = book_phone;
		this.book_guest = book_guest;
		this.book_date = book_date;
		this.book_time = book_time;
		this.book_message = book_message;
		this.book_status = book_status;
		this.book_amount = book_amount;
		this.book_tnxid = book_tnxid;
	}
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getBook_email() {
		return book_email;
	}
	public void setBook_email(String book_email) {
		this.book_email = book_email;
	}
	public String getBook_phone() {
		return book_phone;
	}
	public void setBook_phone(String book_phone) {
		this.book_phone = book_phone;
	}
	public String getBook_guest() {
		return book_guest;
	}
	public void setBook_guest(String book_guest) {
		this.book_guest = book_guest;
	}
	public String getBook_date() {
		return book_date;
	}
	public void setBook_date(String book_date) {
		this.book_date = book_date;
	}
	public String getBook_time() {
		return book_time;
	}
	public void setBook_time(String book_time) {
		this.book_time = book_time;
	}
	public String getBook_message() {
		return book_message;
	}
	public void setBook_message(String book_message) {
		this.book_message = book_message;
	}
	public String getBook_status() {
		return book_status;
	}
	public void setBook_status(String book_status) {
		this.book_status = book_status;
	}
	public String getBook_amount() {
		return book_amount;
	}
	public void setBook_amount(String book_amount) {
		this.book_amount = book_amount;
	}
	public String getBook_tnxid() {
		return book_tnxid;
	}
	public void setBook_tnxid(String book_tnxid) {
		this.book_tnxid = book_tnxid;
	}
	@Override
	public String toString() {
		return "Reserve [book_id=" + book_id + ", book_name=" + book_name + ", book_email=" + book_email
				+ ", book_phone=" + book_phone + ", book_guest=" + book_guest + ", book_date=" + book_date
				+ ", book_time=" + book_time + ", book_message=" + book_message + ", book_status=" + book_status
				+ ", book_amount=" + book_amount + ", book_tnxid=" + book_tnxid + ", getBook_id()=" + getBook_id()
				+ ", getBook_name()=" + getBook_name() + ", getBook_email()=" + getBook_email() + ", getBook_phone()="
				+ getBook_phone() + ", getBook_guest()=" + getBook_guest() + ", getBook_date()=" + getBook_date()
				+ ", getBook_time()=" + getBook_time() + ", getBook_message()=" + getBook_message()
				+ ", getBook_status()=" + getBook_status() + ", getBook_amount()=" + getBook_amount()
				+ ", getBook_tnxid()=" + getBook_tnxid() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
	


}
