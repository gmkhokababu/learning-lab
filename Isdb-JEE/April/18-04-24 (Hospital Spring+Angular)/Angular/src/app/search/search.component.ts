import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-search',
  templateUrl: './search.component.html',
  styleUrls: ['./search.component.css']
})
export class SearchComponent implements OnInit {

  constructor(private router: Router) { } //login() er this.router user korar jonno consturctor e parameter router use kora hoyece

  ngOnInit(): void {
  }

  id: any;
  password: any;

  login() {
    this.router.navigateByUrl("show_patient/" + this.id + "/" + this.password);
  }

}
