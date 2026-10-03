import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { EmployeeComponent } from './employee/employee.component';
import { SuccessComponent } from './success/success.component';
import { LoginComponent } from './login/login.component';
import { FailComponent } from './fail/fail.component';

const routes: Routes = [
  {path:'', component:EmployeeComponent},
  {path:'employee', component:EmployeeComponent},
  {path:'success', component:SuccessComponent},
  {path:'login', component:LoginComponent},
  {path:'fail', component:FailComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
