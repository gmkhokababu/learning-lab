import { Component, OnInit } from '@angular/core';
import { Post } from '../models/post';
import { PostService } from '../post.service';

@Component({
  selector: 'app-show-post',
  templateUrl: './show-post.component.html',
  styleUrls: ['./show-post.component.css']
})
export class ShowPostComponent implements OnInit {

  constructor(private myPost: PostService) { 
    this.allPost = this.myPost.m1();
  }

  ngOnInit(): void {
  }

  allPost:Post[] = [
  ]
 

}
