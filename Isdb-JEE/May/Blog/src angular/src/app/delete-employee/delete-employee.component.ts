import { Component, OnInit } from '@angular/core';
import { Employee } from '../model/employee';
import { Router } from '@angular/router';
import { EmployeeserviceService } from '../service/employeeservice.service';

@Component({
  selector: 'app-delete-employee',
  templateUrl: './delete-employee.component.html',
  styleUrls: ['./delete-employee.component.css']
})
export class DeleteEmployeeComponent implements OnInit {


  emp_id:any;
  emp_name:any;
  emp_email:any;
  emp_password:any;
  getEmployee:any;

  empData:any;
  deleteEmployee:any;


  constructor(private router: Router, private myservice: EmployeeserviceService) {
    this.empData = this.router.getCurrentNavigation()?.extras.state?.["response"];
    this.emp_id = this.empData.emp_id;
    this.emp_name = this.empData.emp_name;
    this.emp_email = this.empData.emp_email;
    this.emp_password = this.empData.emp_password;

   }

  ngOnInit(): void {
  }

  userDelete(){
    this.deleteEmployee = new Employee(this.emp_id,this.emp_name,this.emp_email,this.emp_password);
    this.myservice.empDelete(this.deleteEmployee).subscribe(() => {
      this.router.navigateByUrl("allemployee");
    });
    // this.router.navigateByUrl("allemployee");
  }

}
