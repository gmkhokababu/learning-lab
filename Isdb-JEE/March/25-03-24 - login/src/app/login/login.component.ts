import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { LoginService } from '../login.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {



  id:any;
  password: any;
  user:any = {};
  p:any[] = [];

  m1(){

    this.p = this.myService.getAllUsers().slice();

   this.user = this.p.find(x=>(x.id === this.id) && (x.password === this.password));
   if(this.user != null){
    // alert("id: " + this.user.id);

    this.myService.data = this.user;
    this.router.navigateByUrl("success");
   }else{
    this.router.navigateByUrl("fail");
   }
    
  }

  constructor(private router: Router, private myService: LoginService) { }

  ngOnInit(): void {
  }

}
