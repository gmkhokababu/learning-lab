import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { EmployeeComponent } from './employee/employee.component';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { EmployeeserviceService } from './service/employeeservice.service';
import { SuccessComponent } from './success/success.component';
import { LoginComponent } from './login/login.component';
import { FailComponent } from './fail/fail.component';
import { HeaderComponent } from './header/header.component';
import { FooterComponent } from './footer/footer.component';
import { HomeComponent } from './home/home.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { AllEmployeeComponent } from './all-employee/all-employee.component';
import { AddNewsComponent } from './add-news/add-news.component';
import { AllNewsComponent } from './all-news/all-news.component';
import { EditNewsComponent } from './edit-news/edit-news.component';
import { UserUpdateComponent } from './user-update/user-update.component';
import { AdminInfoComponent } from './admin-info/admin-info.component';
import { DeleteEmployeeComponent } from './delete-employee/delete-employee.component';

@NgModule({
  declarations: [
    AppComponent,
    EmployeeComponent,
    SuccessComponent,
    LoginComponent,
    FailComponent,
    HeaderComponent,
    FooterComponent,
    HomeComponent,
    DashboardComponent,
    AllEmployeeComponent,
    AddNewsComponent,
    AllNewsComponent,
    EditNewsComponent,
    UserUpdateComponent,
    AdminInfoComponent,
    DeleteEmployeeComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule
  ],
  providers: [EmployeeserviceService],
  bootstrap: [AppComponent]
})
export class AppModule { }
