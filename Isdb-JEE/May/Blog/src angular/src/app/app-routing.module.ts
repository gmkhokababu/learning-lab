import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { EmployeeComponent } from './employee/employee.component';
import { SuccessComponent } from './success/success.component';
import { LoginComponent } from './login/login.component';
import { FailComponent } from './fail/fail.component';
import { HomeComponent } from './home/home.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { AllEmployeeComponent } from './all-employee/all-employee.component';
import { AddNewsComponent } from './add-news/add-news.component';
import { AllNewsComponent } from './all-news/all-news.component';
import { EditNewsComponent } from './edit-news/edit-news.component';
import { UserUpdateComponent } from './user-update/user-update.component';
import { AdminInfoComponent } from './admin-info/admin-info.component';
import { DeleteEmployeeComponent } from './delete-employee/delete-employee.component';

const routes: Routes = [
  {path:'', component:HomeComponent},
  {path:'employee', component:EmployeeComponent},
  {path:'success', component:SuccessComponent},
  {path:'login', component:LoginComponent},
  {path:'fail', component:FailComponent},
  {path:'dashboard', component:DashboardComponent},
  {path:'allemployee', component:AllEmployeeComponent},
  {path: 'addnews', component: AddNewsComponent},
  {path: 'allnews', component: AllNewsComponent},
  {path: 'edit', component: EditNewsComponent},
  {path: 'update-user', component: UserUpdateComponent},
  {path: 'admin-info', component: AdminInfoComponent},
  {path: 'delete-employee', component: DeleteEmployeeComponent},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
