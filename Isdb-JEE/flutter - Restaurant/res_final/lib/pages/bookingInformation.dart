import 'package:flutter/material.dart';
import 'package:res_final/pages/addNewBooking.dart';
import 'package:res_final/pages/allBooking.dart';

import '../adminnav.dart';

class Bookinginformation extends StatefulWidget {
  const Bookinginformation({super.key});

  @override
  State<Bookinginformation> createState() => _BookinginformationState();
}

class _BookinginformationState extends State<Bookinginformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Adminnav(),
      appBar: AppBar(
        title: Text("Booking Information",style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          // Image.asset("images/unnamed.jpg",height: 150, width:double.infinity,fit: BoxFit.cover),
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
                            Icons.add,
                            size: 50,
                            color: Colors.pink,
                          ),
                          Text(
                            "New Booking",
                            style: TextStyle(fontSize: 20),
                          ),

                        ],
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Addnewbooking()));
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
                            Icons.table_bar,
                            size: 50,
                            color: Colors.pink,
                          ),
                          Text(
                            "All Bookings",
                            style: TextStyle(fontSize: 20),
                          ),

                        ],
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Allbooking()));
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
