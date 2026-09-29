import { Component, OnInit } from '@angular/core';
import { ServiceService } from '../Services/service.service';
import { Comments } from '../Model/comments';

@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.css']
})
export class AdminComponent implements OnInit {
  allComments: any


  constructor(
    private service: ServiceService
  ) {
    this.service.getAllComments().subscribe(
      (data) => {
        this.allComments = data;
      }
    )
  }

  ngOnInit(): void {
  }


  isPusblishable: any;
  published(value: any) {
    alert(value)
  }


  updateComment(c: Comments) {
    c.publish = !c.publish;
    this.service.updatComment(c).subscribe(() => {
      this.service.getAllComments().subscribe((data: any) => {
        this.allComments = data;
      })
    })
  }


}
