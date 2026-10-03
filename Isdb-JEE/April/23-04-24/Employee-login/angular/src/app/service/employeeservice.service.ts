import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Employee } from '../model/employee';

@Injectable({
  providedIn: 'root'
})
export class EmployeeserviceService {

  constructor(private http:HttpClient) { }

  url:any ="http://localhost:8080/";



  loginById(id:any,password:any):Observable<Employee>{ //data ese joma hoise, je subscribe korbe take data dibe
    this.url="http://localhost:8080/";
    return this.http.get<Employee>(this.url+id+"/"+password);
  }
}


