package com.example.demo.Entity;

public class Blog {
	
	
	int blog_id;
	String writer;
	String title;
	String description;
	String publ_date;
	String image;
	
	

	public Blog() {
		// TODO Auto-generated constructor stub
	}



	public Blog(int blog_id, String writer, String title, String description, String publ_date, String image) {
		super();
		this.blog_id = blog_id;
		this.writer = writer;
		this.title = title;
		this.description = description;
		this.publ_date = publ_date;
		this.image = image;
	}



	public int getBlog_id() {
		return blog_id;
	}



	public void setBlog_id(int blog_id) {
		this.blog_id = blog_id;
	}



	public String getWriter() {
		return writer;
	}



	public void setWriter(String writer) {
		this.writer = writer;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public String getPubl_date() {
		return publ_date;
	}



	public void setPubl_date(String publ_date) {
		this.publ_date = publ_date;
	}



	public String getImage() {
		return image;
	}



	public void setImage(String image) {
		this.image = image;
	}



	@Override
	public String toString() {
		return "Blog [blog_id=" + blog_id + ", writer=" + writer + ", title=" + title + ", description=" + description
				+ ", publ_date=" + publ_date + ", image=" + image + "]";
	}
	

}
