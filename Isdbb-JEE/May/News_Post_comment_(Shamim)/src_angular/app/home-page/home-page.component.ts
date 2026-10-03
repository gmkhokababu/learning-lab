import { Component, OnInit } from '@angular/core';
import { ServiceService } from '../Services/service.service';

@Component({
  selector: 'app-home-page',
  templateUrl: './home-page.component.html',
  styleUrls: ['./home-page.component.css']
})
export class HomePageComponent implements OnInit {

  allBlog:any
  constructor(
    private blogservice:ServiceService
  ) {
    this.allBlog=blogservice.getAllBlog().subscribe(
      (data:any)=>{
        this.allBlog=data;
      }
    )
   }

  ngOnInit(): void {
  }

}
