import { Component } from '@angular/core';
import { User } from '../../models/user';
import { LoginServiceService } from '../../services/login-service.service';
import { Route, Router } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { error } from 'console';
@Component({
  selector: 'app-create-user',
  standalone: true,
  imports: [
    FormsModule
  ],
  templateUrl: './create-user.component.html',
  styleUrl: './create-user.component.css'
})
export class CreateUserComponent {

  constructor(private service:LoginServiceService, private router:Router){}

  userId: any;
  userName: any;
  password: any;

  user:any;

  createUser(){
    if(this.check()){
      this.user=new User(this.userId,this.userName,this.password);
    this.service.createUser(this.user).subscribe({
      next:(res:any)=>{
        this.router.navigateByUrl("/home");
      },
    error: (error) => {
        // Print full error in browser console
        console.error("Server Error:", error);

        // Show user-friendly alert
        if (error.status === 409) {
          alert(error.error.message); // "Username already exists"
        } else {
          alert("Something went wrong: " + error.error.message);
        }
      }
    });
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
}
