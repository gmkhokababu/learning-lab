import { Component } from '@angular/core';
import { StudentService } from './service/student.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  id:number = 0;
  name: string = "";
  email: string = "";
  round: string = "";
  gender: string ="";

  studentObject:any ={}
  p:any=[];

  constructor(private myService:StudentService){
    // this.p=this.myService.getData();
  }


  addDetails(){
    this.studentObject={id: this.id, name:this.name,email: this.email, round: this.round,gender:this.gender};
    this.myService.getData().push(this.studentObject);
    alert("Data Added!");
  }

  showDetails(){
    this.p=this.myService.getData().slice();
  }





}
