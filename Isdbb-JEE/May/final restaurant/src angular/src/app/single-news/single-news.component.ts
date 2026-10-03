import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { EmployeeserviceService } from '../service/employeeservice.service';

@Component({
  selector: 'app-single-news',
  templateUrl: './single-news.component.html',
  styleUrls: ['./single-news.component.css']
})
export class SingleNewsComponent implements OnInit {
  getSingleNews: any;

  news_id: any;
  writer: any;
  title: any;
  description: any;
  publ_date: any;
  image: any;
  category: any;


  id:any

  constructor(private router: Router, private myservice: EmployeeserviceService,
    private route:ActivatedRoute,
  ) {
    this.getSingleNews = this.router.getCurrentNavigation()?.extras.state?.["response"];
    this.news_id = this.getSingleNews.news_id;
    this.writer = this.getSingleNews.writer;
    this.title = this.getSingleNews.title;
    this.description = this.getSingleNews.description;
    this.publ_date = this.getSingleNews.publ_date;
    this.image = this.getSingleNews.image;
    this.category = this.getSingleNews.category;


    this.id=this.route.snapshot.params["sazid"];
    alert(this.id)


  }

  ngOnInit(): void {
  }

}
