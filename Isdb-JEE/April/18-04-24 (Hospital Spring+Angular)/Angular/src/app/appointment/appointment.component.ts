import { Component, OnInit } from '@angular/core';
import { AppointmentService } from '../services/appointment.service';
import { AppointmentTable } from '../models/appointment-table';

@Component({
  selector: 'app-appointment',
  templateUrl: './appointment.component.html',
  styleUrls: ['./appointment.component.css']
})
export class AppointmentComponent implements OnInit {

  constructor(private myservice:AppointmentService) { } // connection component with services

  ngOnInit(): void {
  }
  a_id:any;
  p_name:any;
  date:any;
  phone:any;
  problem:any;
  dept_name:any;
  email:any;
  d_id:any;
  appointment:any;


  save(){
    this.appointment=new AppointmentTable(this.a_id,this.p_name,this.date,this.phone,this.problem,this.dept_name,this.email,this.d_id);
    this.myservice.save(this.appointment).subscribe(()=>{
      //this.myservice.getallstudents().subscribe((x)=>{this.allstudent=x});
  
    });
  }


}
