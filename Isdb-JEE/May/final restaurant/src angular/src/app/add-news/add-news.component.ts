import { Component, OnInit } from '@angular/core';
import { News } from '../model/news';
import { EmployeeserviceService } from '../service/employeeservice.service';
import { formatDate } from '@angular/common';
import { Router } from '@angular/router';

@Component({
  selector: 'app-add-news',
  templateUrl: './add-news.component.html',
  styleUrls: ['./add-news.component.css']
})
export class AddNewsComponent implements OnInit {

  constructor(private myservice : EmployeeserviceService, private router: Router) { }

  ngOnInit(): void {
  }

  currentDate = new Date();

  news_id: any;
  writer: any;
  title: any;
  description: any;
  publ_date: any = formatDate(this.currentDate, 'yyyy-MM-dd', 'en-US');
  image: any;
  category: any;

  allNews: any;

  addNews() {
    this.allNews = new News(this.news_id, this.writer, this.title, this.description,this.publ_date,this.image,this.category);
    this.myservice.addNews(this.allNews).subscribe(() => {});
    this.router.navigateByUrl("allnews");
  }

}
