import 'package:flutter/material.dart';
import 'package:res_final/customerNav.dart';
import 'package:res_final/pages/ecom_home_screen.dart';

class Customerdashboard extends StatefulWidget {
  const Customerdashboard({super.key});

  @override
  State<Customerdashboard> createState() => _CustomerdashboardState();
}

class _CustomerdashboardState extends State<Customerdashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Customernav(),
      appBar: AppBar(
        title: Text("Customer Dashboard",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          Image.asset("images/banner-3.jpg"),
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
                            Icons.event_available,
                            size: 50,
                            color: Colors.pink,
                          ),
                          Text(
                            "Order Now",
                            style: TextStyle(fontSize: 20),
                          ),

                        ],
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => EcomHomeScreen()));
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
