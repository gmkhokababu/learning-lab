import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Appointment } from '../class/appointment';

@Injectable({
  providedIn: 'root'
})
export class HospitalService {

  constructor(private http:HttpClient) { }
  url: string = "http://localhost:8080/";
 
  saveAppointment(appointment: Appointment):Observable<Appointment>{
    this.url = "http://localhost:8080/save";
    return this.http.post<Appointment>(this.url,appointment);
  }

}
