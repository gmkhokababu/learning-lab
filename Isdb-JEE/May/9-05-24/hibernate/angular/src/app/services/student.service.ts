import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Student } from '../student';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class StudentService {

  constructor(private http:HttpClient) { }

    url:any;
    showData(): Observable<Student> {
      this.url = "http://localhost:8080/showalldata";
      return this.http.get<Student>(this.url);
    }

    insert(s:Student):Observable<Student>{
      this.url="http://localhost:8080/insertdata";
      return this.http.post<Student>(this.url,s);
    }
}
