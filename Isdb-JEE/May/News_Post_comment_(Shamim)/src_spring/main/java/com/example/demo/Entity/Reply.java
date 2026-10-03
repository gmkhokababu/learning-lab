package com.example.demo.Entity;

public class Reply {

	int reply_id;
	String name;
	String reply_date;
	
	
	public Reply() {
		// TODO Auto-generated constructor stub
	}


	public Reply(int reply_id, String name, String reply_date) {
		super();
		this.reply_id = reply_id;
		this.name = name;
		this.reply_date = reply_date;
	}


	public int getReply_id() {
		return reply_id;
	}


	public void setReply_id(int reply_id) {
		this.reply_id = reply_id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getReply_date() {
		return reply_date;
	}


	public void setReply_date(String reply_date) {
		this.reply_date = reply_date;
	}


	@Override
	public String toString() {
		return "Reply [reply_id=" + reply_id + ", name=" + name + ", reply_date=" + reply_date + "]";
	}
	
	

}
