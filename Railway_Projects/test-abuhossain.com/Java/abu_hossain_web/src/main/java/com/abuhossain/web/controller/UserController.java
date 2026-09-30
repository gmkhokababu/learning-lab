package com.abuhossain.web.controller;



import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.abuhossain.web.entity.User;
import com.abuhossain.web.services.UserService;



@RestController
//@CrossOrigin(origins = "http://localhost:4200")
@CrossOrigin(origins = {"https://abuhossain.com","https://test.abuhossain.com"})
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;

	@PostMapping("/create-user")
	public ResponseEntity<?> createUser(@RequestBody User user) {
		try {
		System.out.println("user create method call");
		User userData = userService.addUser(user);
		return ResponseEntity.ok(userData);
		}catch(DataIntegrityViolationException e) {
			return ResponseEntity.status(HttpStatus.CONFLICT).body(Collections.singletonMap("message", "Username already exists"));
		}catch(Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Collections.singletonMap("message", "Something went wrong"));
		}
	}
	
	@PostMapping("/login")
	public ResponseEntity<?> login(@RequestBody User user) {
		try {
		System.out.println("user name:"+user.getUserName());
		User userData = userService.login(user.getUserName(), user.getPassword());
		 if (userData == null) {
	            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
	                                 .body(Collections.singletonMap("message", "Invalid username or password"));
	        }
		return ResponseEntity.ok(userData);
		}catch(Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Collections.singletonMap("message", "Something went wrong"));
		}
	}
}
