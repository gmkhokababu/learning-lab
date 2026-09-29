package com.example.demo.Entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


public class Comments {
	int comment_id;
	int blog_id;
	String comments;
	boolean  publish;
	
	
	public Comments() {
		super();
	}


	public Comments(int comment_id, int blog_id, String comments, boolean publish) {
		super();
		this.comment_id = comment_id;
		this.blog_id = blog_id;
		this.comments = comments;
		this.publish = publish;
	}


	public int getComment_id() {
		return comment_id;
	}


	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}


	public int getBlog_id() {
		return blog_id;
	}


	public void setBlog_id(int blog_id) {
		this.blog_id = blog_id;
	}


	public String getComments() {
		return comments;
	}


	public void setComments(String comments) {
		this.comments = comments;
	}


	public boolean isPublish() {
		return publish;
	}


	public void setPublish(boolean publish) {
		this.publish = publish;
	}


	@Override
	public String toString() {
		return "Comments [comment_id=" + comment_id + ", blog_id=" + blog_id + ", comments=" + comments + ", publish="
				+ publish + "]";
	}
	
	

}
