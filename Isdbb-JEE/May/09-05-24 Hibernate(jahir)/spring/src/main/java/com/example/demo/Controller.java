package com.example.demo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin(origins="http://localhost:4200/")
public class Controller {
	private final StudentRepo studentRepo;

	@Autowired
	public Controller(StudentRepo studentRepo) {
		this.studentRepo=studentRepo;
	
	}
	
	List<Student> slist=new ArrayList<>();
	
	@GetMapping("/showalldata")
	public List<Student> show(){
		slist=(List<Student>) studentRepo.findAll();
		return slist;
	}
	
//	---------------------------- insert ------------------------
	
//	@PostMapping("/insertdata")
//	public Student doinsert(@RequestBody Student s) {
//
//		StudentDA da = new StudentDA();
//		Student data = da.insert(s);
//
//		return data;
//	}
	
	@PostMapping("/insertdata")
	public Student doinsert(@RequestBody Student s) {
		Student data = studentRepo.save(s);
		return data;
	}

}
