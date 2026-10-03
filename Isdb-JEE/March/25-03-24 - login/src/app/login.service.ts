import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class LoginService {
  constructor() { }

  users:any[] = [
    {
      id: 101, 
      name: "sazid",
      password:"123"
    },
    {
      id: 102, 
      name: "Mahmud",
      password:"1234"
    },
    {
      id: 103, 
      name: "Mizan",
      password:"123456"
    },
  ];

  public getAllUsers(){
    return this.users;
  }
  public data:any;




}
