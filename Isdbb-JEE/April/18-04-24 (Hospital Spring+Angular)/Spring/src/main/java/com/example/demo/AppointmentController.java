package com.example.demo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin(origins="http://localhost:4200") // angular er sathe spring er link korabe
@RestController  // spring e data ante @RestController lage
public class AppointmentController {
	
	@PostMapping("/save" ) //data asle postmapping 
	public AppointmentTable dosave(@RequestBody AppointmentTable s) { //data dhorar jonno @RequestBody dite hobe
		AppointmentTableDb da = new AppointmentTableDb(); // data access er object create 
		AppointmentTable st=  da.save(s); // data access e data transfer

		return st;
	}

List<AppointmentTable> pp=new ArrayList<>();
	
	@GetMapping("/all")
	public List<AppointmentTable> m2() {
		AppointmentTableDb da = new AppointmentTableDb();
		pp = da.allstudent();

		return pp;
	}
	
	@GetMapping("/{id}/{password}") // table theke id password niye asbe tai @GetMapping, "/{id}/{password}" parameter url er maddome data asbe
	public List<AppointmentTable> m3(@PathVariable int id,@PathVariable String password) { // @PathVariable - url theke data ese id variable e joma hobe 
		AppointmentTableDb da = new AppointmentTableDb();
		pp = da.searchById(id,password);
		return pp;
	}
}
