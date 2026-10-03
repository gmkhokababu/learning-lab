package model;

public class CustomerLogin {

	public int customer_id; 
	String customer_name;
	String customer_email; 
	String customer_pass;
	
	public CustomerLogin() {
		super();
	}

	public CustomerLogin(int customer_id, String customer_name, String customer_email, String customer_pass) {
		super();
		this.customer_id = customer_id;
		this.customer_name = customer_name;
		this.customer_email = customer_email;
		this.customer_pass = customer_pass;
	}
	
	

	public int getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}

	public String getCustomer_name() {
		return customer_name;
	}

	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}

	public String getCustomer_email() {
		return customer_email;
	}

	public void setCustomer_email(String customer_email) {
		this.customer_email = customer_email;
	}

	public String getCustomer_pass() {
		return customer_pass;
	}

	public void setCustomer_pass(String customer_pass) {
		this.customer_pass = customer_pass;
	}

	@Override
	public String toString() {
		return "CustomerLogin [customer_id=" + customer_id + ", customer_name=" + customer_name + ", customer_email="
				+ customer_email + ", customer_pass=" + customer_pass + ", getCustomer_id()=" + getCustomer_id()
				+ ", getCustomer_name()=" + getCustomer_name() + ", getCustomer_email()=" + getCustomer_email()
				+ ", getCustomer_pass()=" + getCustomer_pass() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}


	
	
	
}
