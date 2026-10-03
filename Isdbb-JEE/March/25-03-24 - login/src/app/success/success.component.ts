import { Component, OnInit } from '@angular/core';
import { LoginService } from '../login.service';

@Component({
  selector: 'app-success',
  templateUrl: './success.component.html',
  styleUrls: ['./success.component.css']
})
export class SuccessComponent implements OnInit {

  xyz:any;

  constructor(private myService: LoginService) { 
    this.xyz = this.myService.data;
  }

  ngOnInit(): void {
  }

}
