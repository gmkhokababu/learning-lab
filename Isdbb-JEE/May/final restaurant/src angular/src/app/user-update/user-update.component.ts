import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Employee } from '../model/employee';
import { EmployeeserviceService } from '../service/employeeservice.service';

@Component({
  selector: 'app-user-update',
  templateUrl: './user-update.component.html',
  styleUrls: ['./user-update.component.css']
})
export class UserUpdateComponent implements OnInit {

  emp_id:any;
  emp_name:any;
  emp_email:any;
  emp_password:any;
  getEmployee:any;
  updatedEmployee: any; 

  constructor(private router: Router, private myservice: EmployeeserviceService ) {
    this.getEmployee = this.router.getCurrentNavigation()?.extras.state?.["response"];
    this.emp_id = this.getEmployee.emp_id;
    this.emp_name = this.getEmployee.emp_name;
    this.emp_email = this.getEmployee.emp_email;
    this.emp_password = this.getEmployee.emp_password; 
   }

  ngOnInit(): void {
  }

  userUpdate(){
    this.updatedEmployee = new Employee(this.emp_id,this.emp_name,this.emp_email,this.emp_password);
    this.myservice.empUpdate(this.updatedEmployee).subscribe(() => {});
    this.router.navigateByUrl("allemployee");
  }
  

}
