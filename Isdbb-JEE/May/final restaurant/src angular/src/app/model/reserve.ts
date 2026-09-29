export class Reserve {

    book_id: any;
    book_name: any;
    book_email: any;
    book_phone: any;
    book_guest: any;
    book_date: any;
    book_time: any;
    book_message: any;
    book_status: any;
    book_amount:any;
    book_tnxid:any;

    
    // book_id, book_name, book_email, book_phone, 
    // book_guest, book_date, book_time, book_message, book_status

    constructor(book_id: any, book_name: any ,book_email: any, book_phone: any ,book_guest: any, book_date: any, book_time: any, book_message: any,book_status: any,book_amount:any,book_tnxid:any){
        this.book_id = book_id;
        this.book_name = book_name;
        this.book_email = book_email;
        this.book_phone = book_phone;
        this.book_guest = book_guest;
        this.book_date = book_date;
        this.book_time = book_time;
        this.book_message = book_message;
        this.book_status = book_status;
        this.book_amount = book_amount;
        this.book_tnxid = book_tnxid;
    }
}
