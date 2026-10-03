export class Doctors {
    patient_name:string;
    date:string;
    phone:number;
    department_name:string;
    email: string;
    doctor_id: number;
    constructor(patient_name: string, date:string, phone: number, department_name:string, email:string,doctor_id:number){
        this.patient_name = patient_name;
        this.date =date;
        this.phone = phone;
        this.department_name = department_name;
        this.email = email;
        this.doctor_id = doctor_id;
    }


}
