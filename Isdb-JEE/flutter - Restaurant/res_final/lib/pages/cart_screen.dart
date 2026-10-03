import 'package:flutter/material.dart';

import '../model/product_model.dart';
import 'PaymentScreen.dart';

class CartScreen extends StatefulWidget {
  List<ProductModel>? cartList;
  CartScreen({super.key,this.cartList});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var netTotal;
  void getTotal(){
    netTotal= widget.cartList!.map((item) => item.price!.toInt()*item.quantity)
        .reduce((value, element) => value+element);
}
@override
  void initState() {
    widget.cartList!.length > 0 ? getTotal(): 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Toatal item is ${widget.cartList!.length}"),),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.cartList!.length,
                  itemBuilder: (context,index){
                return Container(
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("${widget.cartList![index].image}",height: 80,width: 80,),
                      Text("${widget.cartList![index].name}"),
                      Text("${widget.cartList![index].price !* widget.cartList![index].quantity}"),
                      Row(
                        children: [
                          IconButton(onPressed: (){
                            widget.cartList![index].quantity > 0? widget.cartList![index].quantity--: widget.cartList!.removeAt(index);
                            getTotal();
                            setState(() {

                            });

                          }, icon: Icon(Icons.remove)),
                          Text("${widget.cartList![index].quantity}"),
                          IconButton(onPressed: (){
                            widget.cartList![index].quantity++;
                            getTotal();
                            setState(() {

                            });

                          }, icon: Icon(Icons.add)),
                          IconButton(onPressed: (){
                            widget.cartList!.removeAt(index);
                            getTotal();
                            setState(() {

                            });

                          }, icon: Icon(Icons.delete)),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ),
            Container(
              height: 40,
              width: double.infinity,
              color: Colors.orange,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Total amount is ${netTotal}"),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentScreen(totalAmount: netTotal),
                        ),
                      );
                    },
                    child: Text("Payment"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
