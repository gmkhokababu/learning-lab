import { Component, OnInit } from '@angular/core';
import { EmployeeserviceService } from '../service/employeeservice.service';
import { ActivatedRoute, Router } from '@angular/router';
import { state } from '@angular/animations';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  constructor(private myservice: EmployeeserviceService, private router: Router) { }
  id: any;
  password: any;
  loginUser: any;
  ngOnInit(): void {



  }


  login() {
    this.myservice.loginById(this.id, this.password).subscribe((x) => {
      this.loginUser = x;
      if ((this.loginUser != null)) {
        this.router.navigateByUrl("employee", { state: { response: this.loginUser } });
      } else {
        this.router.navigateByUrl("fail");
      }
    });



  }

}
