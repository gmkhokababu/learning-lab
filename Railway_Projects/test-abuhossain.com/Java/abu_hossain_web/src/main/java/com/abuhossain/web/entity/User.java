package com.abuhossain.web.entity;

import jakarta.persistence.*;

@Entity
@Table(name="users",
		uniqueConstraints= {
				@UniqueConstraint(columnNames="user_name") //for unique Username
		})
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) //auto generated primary key
	@Column(name="user_id")
	private long userId;
	
	@Column(name="user_name", nullable = false, unique = true) //null hobe na + unique hobe;
	private String userName;
	
	@Column(name="password",nullable = false) //password null hobe na
	private String password;
	
	
	public User() {
		super();
	}
	public User(String userName, String password) {
		this.userName=userName;
		this.password=password;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", password=" + password + ", getUserId()="
				+ getUserId() + ", getUserName()=" + getUserName() + ", getPassword()=" + getPassword()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
}
