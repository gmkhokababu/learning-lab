import { Injectable } from '@angular/core';
import { Post } from './models/post';

@Injectable({
  providedIn: 'root'
})
export class PostService {

  constructor() { }
  post=[
    new Post(1,1,"xyz","abc"),
    new Post(2,2,"xyz2","abc2"),
  ];
m1(){
  return this.post;
}


}
