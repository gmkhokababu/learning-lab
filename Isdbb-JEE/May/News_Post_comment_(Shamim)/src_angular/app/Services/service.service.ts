import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Blog } from '../Model/blog';
import { Comments } from '../Model/comments';

@Injectable({
  providedIn: 'root'
})
export class ServiceService {

  constructor(
    private http:HttpClient
  ) { }


  url:any="http://localhost:8080/getAllBlog";

  getAllBlog():Observable<Blog>{
    this.url="http://localhost:8080/getAllBlog";
    return this.http.get<Blog>(this.url);
  }

  getBlogById(blog_id:any):Observable<Blog>{
    this.url="http://localhost:8080/getBlogById/";

    return this.http.get<Blog>(this.url+blog_id);
  }

  saveComment(comment:Comments):Observable<Comments>{
    this.url="http://localhost:8080/saveComments";
    return this.http.post<Comments>(this.url,comment);
  }

  getAllComments():Observable<Comments>{
    this.url="http://localhost:8080/getAllComments";
    return this.http.get<Comments>(this.url);
  }

  updatComment(comment:Comments):Observable<Comments>{
    this.url="http://localhost:8080/updateComment";
    return this.http.put<Comments>(this.url,comment);
  }
}
