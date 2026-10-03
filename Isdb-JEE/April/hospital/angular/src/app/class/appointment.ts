export class Appointment {
    patient_name:any;
    date:any;
    phone:any;
    department_name:any;
    email: any;
    doctor_id: any;
    constructor(patient_name: any, date:any, phone: any, department_name:any, email:any,doctor_id:any){
        this.patient_name = patient_name;
        this.date =date;
        this.phone = phone;
        this.department_name = department_name;
        this.email = email;
        this.doctor_id = doctor_id;
    }
}
