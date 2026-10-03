import { Component, OnInit } from '@angular/core';
import { EmployeeserviceService } from '../service/employeeservice.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-reservation',
  templateUrl: './reservation.component.html',
  styleUrls: ['./reservation.component.css']
})
export class ReservationComponent implements OnInit {


  allReservation:any=[];

  constructor(private myservice:EmployeeserviceService, private router: Router) { 
    this.myservice.showAllReservation().subscribe((response) => {this.allReservation= response});
  }

  ngOnInit(): void {
  }
  


  
  resDetails(book_id: number){
    
    alert(book_id);
  }
}
