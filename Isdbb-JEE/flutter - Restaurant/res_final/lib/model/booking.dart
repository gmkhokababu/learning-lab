class Booking{


  int? bookingId;
  int? tableNo;
  int? customerId;
  String? bookingTime;
  String? bookingStatus="booked";
  String? date;
  int? orderId;
  String? customerName;
  String? phone;

  Booking(
      {this.bookingId,
      this.tableNo,
      this.customerId,
      this.bookingTime,
      this.bookingStatus,
      this.date,
      this.orderId,
      this.customerName,
      this.phone});


  factory Booking.fromJson(Map<String,dynamic> json) => Booking(
    bookingId: json["bookingId"],
    tableNo : json["tableNo"],
    customerId: json["customerId"],
    bookingTime: json["bookingTime"],
    bookingStatus: json["bookingStatus"],
    date: json["date"],
    orderId: json["orderId"],
    customerName: json["customerName"],
    phone: json["phone"],
  );


  Map<String,dynamic> toJson(){
    return {
      "bookingId" : bookingId,
      "tableNo" : tableNo,
      "customerId" : customerId,
      "bookingTime" : bookingTime,
      "bookingStatus" : bookingStatus,
      "date" : date,
      "orderId" : orderId,
      "customerName" : customerName,
      "phone" : phone,
    };
  }


}