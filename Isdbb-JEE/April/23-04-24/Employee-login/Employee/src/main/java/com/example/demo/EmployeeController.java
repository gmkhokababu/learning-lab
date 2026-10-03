package com.example.demo;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin(origins="http://localhost:4200/") // angular er sathe link kore
@RestController   // data pass kore/ http request control kore
public class EmployeeController {


	
	
	@GetMapping("/{id}/{password}")
	public Employee m3(@PathVariable int id,@PathVariable String password) {
		EmployeeDA da= new EmployeeDA(); //data service er kache jacche
		Employee data = da.login(id,password); // return kora e ke data er moddhe rakhbe
		return data;
	}
}
