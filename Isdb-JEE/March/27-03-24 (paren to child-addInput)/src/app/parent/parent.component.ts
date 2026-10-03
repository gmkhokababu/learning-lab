import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-parent',
  templateUrl: './parent.component.html',
  styleUrls: ['./parent.component.css']
})
export class ParentComponent implements OnInit {


  id:any;

  m1(a:any){
    this.id = a;
  }

  anotherid: any = "parent"

  constructor() { }

  ngOnInit(): void {
  }

}
