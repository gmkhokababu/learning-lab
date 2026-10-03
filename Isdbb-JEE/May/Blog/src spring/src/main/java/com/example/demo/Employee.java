package com.example.demo;

public class Employee {
	int emp_id;
	String emp_name;
	String emp_email;
	String emp_password;
	public Employee() {
		super();
	}
	public Employee(int emp_id, String emp_name, String emp_email, String emp_password) {
		super();
		this.emp_id = emp_id;
		this.emp_name = emp_name;
		this.emp_email = emp_email;
		this.emp_password = emp_password;
	}
	public int getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getEmp_email() {
		return emp_email;
	}
	public void setEmp_email(String emp_email) {
		this.emp_email = emp_email;
	}
	public String getEmp_password() {
		return emp_password;
	}
	public void setEmp_password(String emp_password) {
		this.emp_password = emp_password;
	}
	@Override
	public String toString() {
		return "Employee [emp_id=" + emp_id + ", emp_name=" + emp_name + ", emp_email=" + emp_email + ", emp_password="
				+ emp_password + ", getEmp_id()=" + getEmp_id() + ", getEmp_name()=" + getEmp_name()
				+ ", getEmp_email()=" + getEmp_email() + ", getEmp_password()=" + getEmp_password() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	

}
