import 'package:flutter/material.dart';

import '../model/product_model.dart';
import 'cart_screen.dart';


class EcomHomeScreen extends StatefulWidget {
  const EcomHomeScreen({super.key});

  @override
  State<EcomHomeScreen> createState() => _EcomHomeScreenState();
}

class _EcomHomeScreenState extends State<EcomHomeScreen> {
  List<ProductModel>? cartList=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order"),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: productList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(mainAxisSpacing: 5,crossAxisCount: 2, crossAxisSpacing: 5),
                  itemBuilder: (context,index){
                return Container(child: Column(
                  children: [
                    Image.asset("${productList[index].image}",height: 150,),
                    Text("${productList[index].name}"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("${productList[index].price}"),
                        InkWell(
                            child: Icon(Icons.shopping_cart,
                            ),
                        onTap: (){
                              try{
                                cartList!.firstWhere((element) => element.id == productList[index].id);
                                var snackBar = SnackBar(content: Text("Already Added"));
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                              catch(e){
                                cartList!.add(productList[index]);
                                setState(() {

                                });
                              }
                        },
                        ),
                      ],
                    ),
                    Text("${productList[index].details }",maxLines: 1,),
                  ],
                ),);
              }),
            ),
            MaterialButton(
              color: Colors.orangeAccent,
              onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CartScreen(
                cartList: cartList,
              )));
            },
              child: Text("Go To Cart(${cartList!.length})"),
            )
          ]
        ),
      ),
    );
  }
}
