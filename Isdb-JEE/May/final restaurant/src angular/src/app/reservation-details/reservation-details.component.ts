import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { EmployeeserviceService } from '../service/employeeservice.service';

@Component({
  selector: 'app-reservation-details',
  templateUrl: './reservation-details.component.html',
  styleUrls: ['./reservation-details.component.css']
})
export class ReservationDetailsComponent implements OnInit {
book_id:any;
singleResDetails: any;

  constructor(private route: ActivatedRoute, private myservice : EmployeeserviceService) {
    this.book_id=route.snapshot.params["book_id"];
    this.myservice.searchResById(this.book_id).subscribe((x) => {this.singleResDetails = x});
    // alert(this.book_id);
   }

  ngOnInit(): void {
    // alert(this.book_id)
    

  }

}
