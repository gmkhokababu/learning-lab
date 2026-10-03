import { Component, OnInit } from '@angular/core';
import { Reserve } from '../model/reserve';
import { EmployeeserviceService } from '../service/employeeservice.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  book_id: any;
  book_name: any;
  book_email: any;
  book_phone: any;
  book_guest: any;
  book_date: any;
  book_time: any;
  book_message: any;
  book_amount:any;
  book_tnxid:any;
  book_status: any = 1;
  reserveAllData: any;

  

  constructor(private myservice: EmployeeserviceService, private router:Router, private route: ActivatedRoute) { }

  ngOnInit(): void {
  }

  reserve() {
    this.reserveAllData = new Reserve(this.book_id, this.book_name, this.book_email, this.book_phone, this.book_guest, this.book_date, this.book_time, this.book_message, this.book_status,this.book_amount,this.book_tnxid);
    this.myservice.reserveTable(this.reserveAllData).subscribe(() => {});
    alert("Reservation Successfull!");
  }

}
