package com.example.demo.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.example.demo.Entity.Blog;
import com.example.demo.Entity.Comments;
import com.example.demo.Entity.Reply;

public class BlogDAO {

	Connection con;
	PreparedStatement stm;

	public BlogDAO() {
		// TODO Auto-generated constructor stub
	}

//	getting blog 

	public List<Blog> getBlog() {
		List<Blog> list = new ArrayList<>();

		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rahat", "root", "root");
			stm = con.prepareStatement("select * from blog");

//			stm.setInt(1, r.getBlog_id());
//			stm.setString(2, r.getWriter());
//			stm.setString(3, r.getTitle());
//			stm.setString(4, r.getDescription());
//			stm.setString(5, r.getPubl_date());
//			stm.setString(6, r.getImage());
			ResultSet rs = stm.executeQuery();
			while (rs.next()) {
				list.add(new Blog(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6)));
			}

			int totalUpdate = stm.executeUpdate();
			con.close();
			System.out.println(totalUpdate);

		} catch (Exception e) {
			System.out.println(e);
		}
		return list;

	}

//	getblog by id

	public Blog getBlogById(int blog_id) {

		Blog data = null;
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/rahat", "root", "root");
			PreparedStatement st = con.prepareStatement("select * from blog where blog_id=?");
			st.setInt(1, blog_id);

			ResultSet rs = st.executeQuery();
			System.out.println("Hello");
			while (rs.next()) {
				data = new Blog(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6));
			}
		} catch (Exception e) {

		}
		return data;

	}

//	getReply data 

	public List<Reply> getReplyData() {
		List<Reply> data = new ArrayList<>();
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/rahat", "root", "root");
			PreparedStatement st = con.prepareStatement("select * from reply");

			ResultSet rs = st.executeQuery();
			System.out.println("Hello");
			while (rs.next()) {
				data.add(new Reply(rs.getInt(1), rs.getString(2), rs.getString(3)));
			}
		} catch (Exception e) {

		}
		return data;

	}

	public void saveComments(Comments c) {
		try {
			System.out.println("dao");
			Date date = new Date();
			java.sql.Date sqldate = new java.sql.Date(date.getTime());

			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rahat", "root", "root");
			PreparedStatement st = con
					.prepareStatement("insert into comment (blog_id,comments,publish ) values (?,?,?)");

			System.out.println("before");

			st.setInt(1, c.getBlog_id());
			st.setString(2, c.getComments());
			st.setBoolean(3, c.isPublish());

			
			st.executeUpdate();
			

			con.close();

		} catch (Exception e) {

		}

		
		
	}
	
	
	public Comments updateComments(Comments c) {
		
		try {
			
			

			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rahat", "root", "root");
			PreparedStatement st = con
					.prepareStatement("update   comment  set publish=? where comment_id=? ");

			

			st.setBoolean(1, c.isPublish());
			st.setInt(2, c.getComment_id());
			st.executeUpdate();
			con.close();

		} catch (Exception e) {

		}
		return null;
	}

//	getting comments 
	public List<Comments> getAllComments() {
		List<Comments> data = new ArrayList<>();
		try {

			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/rahat", "root", "root");
			PreparedStatement st = con.prepareStatement("select * from comment");

			ResultSet rs = st.executeQuery();
			System.out.println("Hello");
			while (rs.next()) {
				data.add(new Comments(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getBoolean(4)));
			}
			st.executeQuery();
		} catch (Exception e) {

			System.out.println(e);
		}
		return data;

	}
	
//	getting comments by is publishable 
	
	
//	public List<Comments> getAllComments() {
//		List<Comments> data = new ArrayList<>();
//		try {
//
//			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/rahat", "root", "root");
//			PreparedStatement st = con.prepareStatement("select * from comment");
//
//			ResultSet rs = st.executeQuery();
//			System.out.println("Hello");
//			while (rs.next()) {
//				data.add(new Comments(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getBoolean(4)));
//			}
//			st.executeQuery();
//		} catch (Exception e) {
//
//			System.out.println(e);
//		}
//		return data;

//	}
	
	
	
}
