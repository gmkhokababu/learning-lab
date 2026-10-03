class ProductModel {
  String? id;
  String? name;
  String? image;
  double? price;
  int quantity = 1;
  String? details;

  ProductModel({this.id, this.name, this.image, this.price, this.details});
}

List<ProductModel> productList = [
  ProductModel(
      id: "1",
      name: "Burger",
      image: "images/burger.png",
      price: 150,
      details: "Juicy beef burger with lettuce and tomato."),
  ProductModel(
      id: "2",
      name: "Pizza",
      image: "images/pizza.png",
      price: 350,
      details: "Cheesy pizza with your choice of toppings."),
  ProductModel(
      id: "3",
      name: "Pasta",
      image: "images/pasta.png",
      price: 600,
      details: "Delicious pasta in a creamy Alfredo sauce."),
  ProductModel(
      id: "4",
      name: "Sushi",
      image: "images/sushi.png",
      price: 1200,
      details: "Fresh sushi rolls with a variety of fillings."),
  ProductModel(
      id: "5",
      name: "Salad",
      image: "images/salad.png",
      price: 400,
      details: "Healthy salad with mixed greens and a vinaigrette."),
  ProductModel(
      id: "6",
      name: "Coffee",
      image: "images/coffee.png",
      price: 200,
      details: "Rich and aromatic coffee brewed fresh."),
  ProductModel(
      id: "7",
      name: "Smoothie",
      image: "images/smoothie.png",
      price: 350,
      details: "Refreshing fruit smoothie with your choice of fruits."),
  ProductModel(
      id: "8",
      name: "Cake",
      image: "images/cake.png",
      price: 700,
      details: "Decadent chocolate cake with creamy frosting."),
  ProductModel(
      id: "9",
      name: "Sandwich",
      image: "images/sandwich.png",
      price: 450,
      details: "Grilled sandwich with ham, cheese, and vegetables."),
  ProductModel(
      id: "10",
      name: "Ice Cream",
      image: "images/ice_cream.png",
      price: 300,
      details: "Creamy ice cream available in various flavors."),
];

