import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-child2',
  templateUrl: './child2.component.html',
  styleUrls: ['./child2.component.css']
})
export class Child2Component implements OnInit {


  @Input() child2Id: any = 0;
  @Input() anotherChild2:any = 'child';

  constructor() { }

  ngOnInit(): void {
  }

}
