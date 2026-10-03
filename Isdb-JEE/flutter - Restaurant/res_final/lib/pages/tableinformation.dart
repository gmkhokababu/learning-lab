import 'package:flutter/material.dart';
import 'package:res_final/adminnav.dart';
import 'package:res_final/pages/addNewTable.dart';
import 'package:res_final/pages/allTables.dart';
import 'package:res_final/pages/availabletables.dart';

class Tableinformation extends StatefulWidget {
  const Tableinformation({super.key});

  @override
  State<Tableinformation> createState() => _TableinformationState();
}

class _TableinformationState extends State<Tableinformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Adminnav(),
      appBar: AppBar(
        title: Text("Table Information",style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          Image.asset("images/lighting.jpg",height: 150, width:double.infinity,fit: BoxFit.cover,),
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
                              "Available Tables",
                              style: TextStyle(fontSize: 20),
                            ),

                          ],
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Availabletables()));
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
                            "Booked Tables",
                            style: TextStyle(fontSize: 20),
                          ),

                        ],
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Alltables()));
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
                            "Add New Table",
                            style: TextStyle(fontSize: 20),
                          ),

                        ],
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Addnewtable()));
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
