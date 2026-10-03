import { Component, OnInit } from '@angular/core';
import { EmployeeserviceService } from '../service/employeeservice.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-all-news',
  templateUrl: './all-news.component.html',
  styleUrls: ['./all-news.component.css']
})
export class AllNewsComponent implements OnInit {

  allNews:any = [];
  singleNewsById:any;

  constructor(private myservice: EmployeeserviceService,private router: Router) { 
    this.myservice.showAllNews().subscribe((newsResponse) => {this.allNews = newsResponse});
  }

  ngOnInit(): void {
  }


  singleNews(news_id:any){
    // this.myservice.searchNewsById(news_id).subscribe((singleNewsResponse)=>{this.singleNewsById =singleNewsResponse;
    //   this.router.navigateByUrl("updatenews",{state:{Response:this.singleNewsById}})
    // });
    // this.router.navigateByUrl("updatenews",{state:{response:this.singleNewsById}});
    alert(news_id);
  }

}
