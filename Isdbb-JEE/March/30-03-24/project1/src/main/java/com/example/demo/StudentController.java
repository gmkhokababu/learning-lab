package com.example.demo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;


@CrossOrigin(origins = "http://localhost:4200")
@RestController

public class StudentController {
	@GetMapping("/")
	public String m1() {
		return "Spring Boot is working";
	}
	
	List<Student> sList = new ArrayList <>();
	
	@GetMapping("/all")
	public List<Student> m2() {
		StudentDA da = new StudentDA();
		sList = da.allStudent();
		
		
		return sList;
	}
}
