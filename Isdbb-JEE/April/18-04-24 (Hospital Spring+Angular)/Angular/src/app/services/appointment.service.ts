import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { AppointmentTable } from '../models/appointment-table';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AppointmentService {

  constructor(private http:HttpClient) { } // data httpclient er maddom e spring er controller e jay "localhost:8080" link er through te
 url:any;

  save(s:AppointmentTable):Observable<AppointmentTable>{ //
    this.url="http://localhost:8080/save"; //
    return this.http.post<AppointmentTable>(this.url,s); //
  }

  getallstudents():Observable<AppointmentTable>{
    this.url="http://localhost:8080/all";
    return this.http.get<AppointmentTable>(this.url);
  }

  getPatientByDoctorId(id:any,password:any):Observable<AppointmentTable>{ // "Observable" return type
    this.url="http://localhost:8080/";
    return this.http.get<AppointmentTable>(this.url+id+"/"+password); //data ashar jonno get use kori
  }
}
