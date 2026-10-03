package com.example.demo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import model.Reserve;

@RestController
@CrossOrigin(origins="http://localhost:4200/")

public class Controller {
	
	@PostMapping("/insert")
	public Employee doSave(@RequestBody Employee s) {
		
		EmployeeDA da = new EmployeeDA();
		Employee data=  da.save(s);

		return data;
	}
	
	
	
	@GetMapping("/{id}/{password}")
	public Employee m3(@PathVariable int id,@PathVariable String password) {
		EmployeeDA da= new EmployeeDA();
		Employee data = da.login(id,password);
		return data;
	}
	
	List<Employee> emp=new ArrayList<>();
	@GetMapping("/allemployee")
	public List<Employee> m2() {
		EmployeeDA da = new EmployeeDA();
		emp = da.allEmployee();

		return emp;
	}
	
//	search by id--------------
	
	
	@GetMapping("/searchbyid/{emp_id}")
	public Employee search(@PathVariable int emp_id) {
		EmployeeDA da = new EmployeeDA();
		Employee emp = da.searchById(emp_id);

		return emp;
	}
	
	@PutMapping("/userupdate")
	public Employee empUpdate(@RequestBody Employee s) {
		EmployeeDA da = new EmployeeDA();
		Employee data = da.empUpdate(s);
		return data;
		
	}
	
//	Delete employee
	@PostMapping("/userdelete")
	public Employee empDelete(@RequestBody Employee s) {
		EmployeeDA da = new EmployeeDA();
		Employee data = da.empDelete(s);
		return data;
	}
	
	
	
	
	
//	News Post----------------
	@PostMapping("/news-insert")
	public News newsInsert(@RequestBody News n) {
		
		EmployeeDA da = new EmployeeDA();
		News data=  da.saveNews(n);

		return data;
	}
	
	// show all news
	List<News> showAllNews=new ArrayList<>();
	@GetMapping("/allnews")
	public List<News> showAllNews() {
		EmployeeDA da = new EmployeeDA();
		showAllNews = da.allNews();

		return showAllNews;
	}
	
	
//	search by id--------------
	
	
	@GetMapping("/searchnewsbyid/{news_id}")
	public News searchNewsById(@PathVariable int news_id) {
		EmployeeDA da = new EmployeeDA();
		News emp = da.searchNewsById(news_id);

		return emp;
	}
	
	

	@PostMapping("/book-table")
	public Reserve reserveTable(@RequestBody Reserve s) {
		
		EmployeeDA da = new EmployeeDA();
		Reserve data =  da.reserveTable(s);

		return data;
	}
	
	// show all Booking
	List<Reserve> showAllBooking=new ArrayList<>();
	@GetMapping("/all-booking")
	public List<Reserve> showAllBooking() {
		EmployeeDA da = new EmployeeDA();
		showAllBooking = da.allBooking();

		return showAllBooking;
	}
	// show reservation by id
	@GetMapping("/resbyid/{book_id}")
	public Reserve ressearchbyid(@PathVariable int book_id) {
		EmployeeDA da = new EmployeeDA();
		Reserve emp = da.resSearchById(book_id);

		return emp;
	}
	

}
