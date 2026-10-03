import { Component, OnInit } from '@angular/core';
import { EmployeeserviceService } from '../service/employeeservice.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-admin-info',
  templateUrl: './admin-info.component.html',
  styleUrls: ['./admin-info.component.css']
})
export class AdminInfoComponent implements OnInit {

  emp_id: any;

  employee:any;

  constructor(private myService: EmployeeserviceService, private router: Router) { }

  ngOnInit(): void {
  }

  search(){
    this.myService.search(this.emp_id).subscribe((x)=>{
      this.employee = x;

    });
  }

}
