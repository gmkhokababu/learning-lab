import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ServiceService } from '../Services/service.service';
import { Comments } from '../Model/comments';

@Component({
  selector: 'app-blog-details',
  templateUrl: './blog-details.component.html',
  styleUrls: ['./blog-details.component.css']
})
export class BlogDetailsComponent implements OnInit {


  allComments: any;

  constructor(
    private route: ActivatedRoute,
    private service: ServiceService
  ) {
    // getBlogBy Id 

    this.blogByid = this.service.getBlogById(this.blogId).subscribe(
      (data: any) => {

        this.blogByid = data;
      })

    this.service.getAllComments().subscribe(
      (data: any) => {
        this.allComments = data;

      }
    )
  }

  blogId: any;
  blogByid: any;

  // allComments:any

  ngOnInit(): void {
    this.blogId = this.route.snapshot.params["blog_id"];
  }
  // end of oninit 


  myBlog: any
  comments: any
  submitComment() {
    this.comments = new Comments(2, this.blogId, this.myBlog, false);
    this.service.saveComment(this.comments).subscribe(
      (data: any) => {

      }
    );
    this.myBlog = "";
  }

  Count: any = 0;

  minusCount() {
    this.Count++;
  }

  plusCount() {
    if (this.Count > 0) {
      this.Count--;
    }
  }

}
