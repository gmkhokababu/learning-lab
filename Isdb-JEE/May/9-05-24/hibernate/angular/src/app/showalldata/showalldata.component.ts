import { Component, OnInit } from '@angular/core';
import { StudentService } from '../services/student.service';

@Component({
  selector: 'app-showalldata',
  templateUrl: './showalldata.component.html',
  styleUrls: ['./showalldata.component.css']
})
export class ShowalldataComponent implements OnInit {
  allData: any;
  constructor(private myservice: StudentService) {
    this.myservice.showData().subscribe((x) => { this.allData = x });
  }

  ngOnInit(): void {
  }

}
