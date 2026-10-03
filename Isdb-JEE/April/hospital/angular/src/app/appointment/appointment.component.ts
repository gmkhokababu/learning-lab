import { Component, OnInit } from '@angular/core';
import { HospitalService } from '../services/hospital.service';
import { Appointment } from '../class/appointment';

@Component({
  selector: 'app-appointment',
  templateUrl: './appointment.component.html',
  styleUrls: ['./appointment.component.css']
})
export class AppointmentComponent implements OnInit {

  patient_name:any;
    date:any;
    phone:any;
    department_name:any;
    email: any;
    doctor_id: any;
  

  constructor(private myservice: HospitalService) { }


  appointmnet:any ;
  ngOnInit(): void {
  }

  save(){
    this.appointmnet = new Appointment(this.patient_name, this.date,this.phone,this.department_name,this.email,this.doctor_id);
    this.myservice.saveAppointment(this.appointmnet).subscribe(()=>{
      
    });
  }


}
