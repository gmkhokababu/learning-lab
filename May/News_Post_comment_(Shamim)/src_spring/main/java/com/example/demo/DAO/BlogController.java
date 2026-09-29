package com.example.demo.DAO;

import java.util.List;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.Entity.Blog;
import com.example.demo.Entity.Comments;
import com.example.demo.Entity.Reply;

@RestController
@CrossOrigin("*")
public class BlogController {

	public BlogController() {
		// TODO Auto-generated constructor stub
	}

	@GetMapping("/getAllBlog")
	public List<Blog> getAllBlog() {

		BlogDAO dao = new BlogDAO();
		List<Blog> blog = dao.getBlog();

		return blog;

	}

//	getBlog by id 
	@GetMapping("/getBlogById/{blog_id}")
	public Blog getBlogById(@PathVariable int blog_id) {
		BlogDAO dao = new BlogDAO();
		Blog blogById = dao.getBlogById(blog_id);

		return blogById;
	}

	@GetMapping("/getAllReply")
	public List<Reply> getAllReply() {
		BlogDAO dao = new BlogDAO();
		List<Reply> replyData = dao.getReplyData();
		return replyData;
	}

//	saveComment

	@PostMapping("/saveComments")
	public void saveComment(@RequestBody Comments c) {
		BlogDAO dao = new BlogDAO();
		dao.saveComments(c);
	}

	@GetMapping("/getAllComments")
	public List<Comments> getAllComments() {
		BlogDAO dao = new BlogDAO();
		List<Comments> allComments = dao.getAllComments();
		return allComments;
	}

	@PutMapping("/updateComment")
	public Comments updateComments(@RequestBody Comments c) {
		BlogDAO dao = new BlogDAO();
		Comments updateComments = dao.updateComments(c);

		return updateComments;

	}

//	 comment update

}
