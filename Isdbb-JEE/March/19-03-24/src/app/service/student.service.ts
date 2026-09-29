import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class StudentService {

  constructor() {}

  students:any[] = [
    {
      id: 101,
      name: 'Rahat',
      email: 'rahat@gmail.com',
      round: "57",
      gender: "Female"
    },
    {
      id: 102,
      name: 'Shamim',
      email: 'shamim@gmail.com',
      round: "58",
      gender: "Male"
    },
    {
      id: 103,
      name: 'Faisal',
      email: 'faisal@gmail.com',
      round: "59",
      gender: "Male"
    },
    {
      id: 104,
      name: 'Aziz',
      email: 'aziz@gmail.com',
      round: "60",
      gender: "Female"
    },
   
  ]
  getData(){
    return this.students;
  }

}
