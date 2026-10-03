class Food{
  int? foodId;
  String? foodName;
  int? foodPrice;
  int? foodQty;

  Food({this.foodId, this.foodName, this.foodPrice, this.foodQty});

  factory Food.fromJson(Map<String, dynamic>json) => Food(
    foodId: json["foodId"],
    foodName: json["foodName"],
    foodPrice: json["foodPrice"],
    foodQty: json["foodQty"],
  );

  Map<String, dynamic> tojson(){
    return {
      "foodId" : foodId,
      "foodName" : foodName,
      "foodPrice" : foodPrice,
      "foodQty" : foodQty,
    };
  }


}