package com.example.demo;

public class Student {
	int id;
	String name;
	String email;
	int round;
	public Student() {
		super();
	}
	public Student(int id, String name, String email, int round) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.round = round;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getRound() {
		return round;
	}
	public void setRound(int round) {
		this.round = round;
	}
	@Override
	public String toString() {
		return "Student [id=" + id + ", name=" + name + ", email=" + email + ", round=" + round + "]";
	}
	
	
}
