import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AppointmentComponent } from './appointment/appointment.component';
import { HomeComponent } from './home/home.component';
import { ShowPatientComponent } from './show-patient/show-patient.component';
import { SearchComponent } from './search/search.component';

const routes: Routes = [
  {path:'',component:HomeComponent},
  {path:'appointment',component:AppointmentComponent},
  {path:'show_patient',component:ShowPatientComponent},
  {path:'show_patient/:id/:password',component:ShowPatientComponent},
  {path:'search',component:SearchComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
