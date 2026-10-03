import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { User } from '../models/user';

@Injectable({
  providedIn: 'root'
})
export class LoginServiceService {

  constructor(private http:HttpClient) { }


  // private baseUrl="https://test.abuhossain.com/api";
  private baseUrl="http://localhost:8080";


  login(user:User){
    return this.http.post(`${this.baseUrl}/user/login`,user);
  }

  createUser(user:User){
    return this.http.post(`${this.baseUrl}/user/create-user`,user);
  }





}
