import { Component, OnInit } from '@angular/core';
import { StudentService } from '../services/student.service';
import { Student } from '../student';
import { Router } from '@angular/router';

@Component({
  selector: 'app-insertpage',
  templateUrl: './insertpage.component.html',
  styleUrls: ['./insertpage.component.css']
})
export class InsertpageComponent implements OnInit {

  id:any;
  name:any;
  round:any;

  postData:any;

  constructor(private myservice:StudentService, private router:Router) { }

  ngOnInit(): void {
  }


  insert() {
    this.postData = new Student(this.id,this.name,this.round );
    this.myservice.insert(this.postData).subscribe(() => {

      this.router.navigateByUrl("showalldata");
     });
    
  }
}
