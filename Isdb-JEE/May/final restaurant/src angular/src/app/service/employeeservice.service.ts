import { Injectable } from '@angular/core';
import { Employee } from '../model/employee';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Reserve } from '../model/reserve';
import { News } from '../model/news';

@Injectable({
  providedIn: 'root'
})
export class EmployeeserviceService {

  constructor(private http:HttpClient) { }

  url:any="http://localhost:8080/";

  // -----------Registration ---------
  insert(s:Employee):Observable<Employee>{
    this.url="http://localhost:8080/insert";
    return this.http.post<Employee>(this.url,s);
  }

// -----------login ---------

  loginById(id:any,password:any):Observable<Employee>{
    this.url="http://localhost:8080/";
    return this.http.get<Employee>(this.url+id+"/"+password);
  }

  // -----------Employe Show (Read) ---------

  getAllEmployee():Observable<Employee>{
    this.url="http://localhost:8080/allemployee";
    return this.http.get<Employee>(this.url);
  }

  // -----------Employe Update (Update) ---------

  //search by id
  search(emp_id: any):Observable<Employee>{
    this.url="http://localhost:8080/searchbyid/";
    return this.http.get<Employee>(this.url+emp_id);
  }

  //sending new data
  empUpdate(newEmp: Employee):Observable<Employee>{
    this.url = "http://localhost:8080/userupdate";
    return this.http.put<Employee>(this.url, newEmp)
  }
  // -----------Employe Delete ---------
  empDelete(s: Employee):Observable<Employee>{
    this.url = "http://localhost:8080/userdelete";
    return this.http.post<Employee>(this.url, s);
  }






  // ----------- reserve ---------
  reserveTable(s: Reserve):Observable<Reserve>{
    this.url = "http://localhost:8080/book-table";
    return this.http.post<Reserve>(this.url, s);
  }
// ----------- show reservation ---------
  showAllReservation():Observable<Reserve>{
    this.url="http://localhost:8080/all-booking";
    return this.http.get<Reserve>(this.url);
  }
  // show single reservatioon
  searchResById(s:any):Observable<Reserve>{
    this.url="http://localhost:8080/resbyid/";
    return this.http.get<Reserve>(this.url+s);
  }





  // ----------- Add News ---------
  addNews(s:News):Observable<News>{
    this.url="http://localhost:8080/news-insert";
    return this.http.post<News>(this.url,s);
  }

    // -----------News Show (Read) ---------

    showAllNews():Observable<News>{
      this.url="http://localhost:8080/allnews";
      return this.http.get<News>(this.url);
    }

    //search by id
  searchNewsById(news_id: any):Observable<News>{
    this.url="http://localhost:8080/searchbyid/";
    return this.http.get<News>(this.url+news_id);
  }
  
  
  
 

}
