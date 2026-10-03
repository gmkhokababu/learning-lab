import 'package:flutter/material.dart';
import 'package:res_final/adminnav.dart';
import 'package:res_final/pages/addNewFood.dart';
// import 'package:res_final/pages/addFood.dart';
import 'package:res_final/pages/admindashboard.dart';
import 'package:res_final/pages/allFoods.dart';

class Foodinformation extends StatefulWidget {
  const Foodinformation({super.key});

  @override
  State<Foodinformation> createState() => _FoodinformationState();
}

class _FoodinformationState extends State<Foodinformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Adminnav(),
      appBar: AppBar(
        title: Text("Food Information",style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          Image.asset("images/banner-1.jpeg"),

          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(20),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              primary: false,
              children: <Widget>[
                Card(
                  color: Colors.white70,
                  child: SizedBox.fromSize(
                    size: Size(80,80),
                    child: InkWell(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.emoji_food_beverage_sharp,
                            size: 50,
                            color: Colors.pink,
                          ),
                          Text(
                            "All Foods",
                            style: TextStyle(fontSize: 20),
                          ),

                        ],
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Allfoods()));
                      },
                    ),
                  ),
                ),
                Card(
                  color: Colors.white70,
                  child: SizedBox.fromSize(
                    size: Size(80,80),
                    child: InkWell(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            size: 50,
                            color: Colors.pink,
                          ),
                          Text(
                            "Add New Food",
                            style: TextStyle(fontSize: 20),
                          ),

                        ],
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Addnewfood()));
                      },
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
