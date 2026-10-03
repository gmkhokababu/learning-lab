package com.example.demo;

public class AppointmentTable {
	int a_id;
	String p_name;
	String date;
	int phone;
	String problem;
	String dept_name;
	String email;
	String d_id;
	public AppointmentTable() {
		super();
	}
	public AppointmentTable(int a_id, String p_name, String date, int phone, String problem, String dept_name,
			String email,String d_id) {
		super();
		this.a_id = a_id;
		this.p_name = p_name;
		this.date = date;
		this.phone = phone;
		this.problem = problem;
		this.dept_name = dept_name;
		this.email = email;
		this.d_id=d_id;
	}
	public int getA_id() {
		return a_id;
	}
	public void setA_id(int a_id) {
		this.a_id = a_id;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	public String getProblem() {
		return problem;
	}
	public void setProblem(String problem) {
		this.problem = problem;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public String getEmail() {
		return email;
	}
	
	public String getD_id() {
		return d_id;
	}
	public void setD_id(String d_id) {
		this.d_id = d_id;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "AppointmentTable [a_id=" + a_id + ", p_name=" + p_name + ", date=" + date + ", phone=" + phone
				+ ", problem=" + problem + ", dept_name=" + dept_name + ", email=" + email + ", d_id=" + d_id + "]";
	}
	
	
	
}
