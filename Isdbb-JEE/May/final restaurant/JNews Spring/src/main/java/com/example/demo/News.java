package com.example.demo;

public class News {

	int news_id;
	String writer;
	String title;
	String description;
	String publ_date;
	String image;
	String category;
	
	public News() {
		super();
	}

	public News(int news_id, String writer, String title, String description, String publ_date, String image,
			String category) {
		super();
		this.news_id = news_id;
		this.writer = writer;
		this.title = title;
		this.description = description;
		this.publ_date = publ_date;
		this.image = image;
		this.category = category;
	}

	public int getNews_id() {
		return news_id;
	}

	public void setNews_id(int news_id) {
		this.news_id = news_id;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "News [news_id=" + news_id + ", writer=" + writer + ", title=" + title + ", description=" + description
				+ ", publ_date=" + publ_date + ", image=" + image + ", category=" + category + ", getNews_id()="
				+ getNews_id() + ", getWriter()=" + getWriter() + ", getTitle()=" + getTitle() + ", getDescription()="
				+ getDescription() + ", getPubl_date()=" + getPubl_date() + ", getImage()=" + getImage()
				+ ", getCategory()=" + getCategory() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}

	

	
	
}
