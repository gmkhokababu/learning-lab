import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-success',
  templateUrl: './success.component.html',
  styleUrls: ['./success.component.css']
})
export class SuccessComponent implements OnInit {
data:any;
  constructor(private router:Router) { 
    this.data=this.router.getCurrentNavigation()?.extras.state?.["response"];
  }

  ngOnInit(): void {
  }

}
