import { Component } from '@angular/core';
import { LoginServiceService } from '../../services/login-service.service';
import { Router } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { User } from '../../models/user';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [
    FormsModule,
  ],
  templateUrl: './login.component.html',
  styleUrl: './login.component.css'
})
export class LoginComponent {

  constructor(private service:LoginServiceService, private router:Router){}
  
    userId: any;
    userName: any;
    password: any;
  
    user:any;
  
    login(){
      if(this.check()){
        this.user=new User(this.userId,this.userName,this.password);
      this.service.login(this.user).subscribe({
       next:(res:any)=>{
        this.router.navigateByUrl("/home");
       },
       error:(error:any)=>{
        if(error.status===401){
          alert(error.error.message) //Invalid username and password
        }else{
          alert("Something went wrong please tray agian later")
        }
       }
      })
      }else{
        alert("Invalid user name and password")
      }
      
    }
    check():boolean{
      // alert("user Name: "+this.userName+"\nPassword :"+this.password)
      if(this.userName!=null && this.password!=null){
        return true;
      }else{
        return false;
      }
    }

    createUser(){
      this.router.navigateByUrl("/create-user")
    }





}
