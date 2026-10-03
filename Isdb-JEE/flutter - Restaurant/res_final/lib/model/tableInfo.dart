class Tableinfo{
  int? tableId;
  int? tableNumber;
  int? tableSit;
  String? tablePosition;
  String? tableService;
  int? fph;
  String? status;

  Tableinfo({this.tableId,
      this.tableNumber,
      this.tableSit,
      this.tablePosition,
      this.tableService,
      this.fph,
      this.status});

  factory Tableinfo.fromJson(Map<String,dynamic> json) => Tableinfo(
    tableId: json["tableId"],
    tableNumber : json["tableNumber"],
    tableSit: json["tableSit"],
    tablePosition: json["tablePosition"],
    tableService: json["tableService"],
    fph: json["fph"],
    status: json["status"],
  );


  Map<String,dynamic> toJson(){
    return {
      "tableId" : tableId,
      "tableNumber" : tableNumber,
      "tableSit" : tableSit,
      "tablePosition" : tablePosition,
      "tableService" : tableService,
      "fph" : fph,
      "status" : status,
    };
  }
}