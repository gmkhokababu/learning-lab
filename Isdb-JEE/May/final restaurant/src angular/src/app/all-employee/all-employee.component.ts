import { Component, OnInit } from '@angular/core';
import { EmployeeserviceService } from '../service/employeeservice.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-all-employee',
  templateUrl: './all-employee.component.html',
  styleUrls: ['./all-employee.component.css']
})
export class AllEmployeeComponent implements OnInit {
  all_emp_details:any=[];

  constructor(private myservice:EmployeeserviceService, private router: Router) {
    this.myservice.getAllEmployee().subscribe((response)=>{this.all_emp_details=response});
   }

  ngOnInit(): void {
  }
  employee:any;
  update(emp_id: any){
    this.myservice.search(emp_id).subscribe((x)=>{
      this.employee = x;
      this.router.navigateByUrl("update-user",{state:{response:this.employee}})

    });
  }

  
  userDelete(emp_id: any){
    this.myservice.search(emp_id).subscribe((x)=>{
      this.employee = x;
      this.router.navigateByUrl("delete-employee",{state:{response:this.employee}})

    });
  }

}
