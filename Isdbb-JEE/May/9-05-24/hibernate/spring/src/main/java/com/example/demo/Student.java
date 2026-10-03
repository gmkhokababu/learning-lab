package com.example.demo;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class Student {
	
	@Id
	int id;
	String name;
	int round;
	
	public Student() {
		super();
	}

	public Student(int id, String name, int round) {
		super();
		this.id = id;
		this.name = name;
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

	public int getRound() {
		return round;
	}

	public void setRound(int round) {
		this.round = round;
	}

	@Override
	public String toString() {
		return "Student [id=" + id + ", name=" + name + ", round=" + round + ", getId()=" + getId() + ", getName()="
				+ getName() + ", getRound()=" + getRound() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}

}
