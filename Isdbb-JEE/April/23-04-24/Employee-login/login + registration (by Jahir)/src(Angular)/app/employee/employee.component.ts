import { Component, OnInit } from '@angular/core';
import { Employee } from '../model/employee';
import { EmployeeserviceService } from '../service/employeeservice.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-employee',
  templateUrl: './employee.component.html',
  styleUrls: ['./employee.component.css']
})
export class EmployeeComponent implements OnInit {

  constructor(private myservice: EmployeeserviceService, private router: Router, private route: ActivatedRoute) { }
 
  ngOnInit(): void {
    
  }

  emp_id: any;
  emp_name: any;
  emp_email: any;
  emp_password: any;
  allData: any;

  insert() {
    this.allData = new Employee(this.emp_id, this.emp_name, this.emp_email, this.emp_password);
    this.myservice.insert(this.allData).subscribe(() => { });
    this.router.navigateByUrl("success");
  }

}








