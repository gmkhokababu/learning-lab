import 'package:flutter/material.dart';
import 'package:res_final/navbar.dart';
import 'package:res_final/page1.dart';
import 'package:res_final/pages/allFoods.dart';
import 'package:res_final/pages/availabletables.dart';
import 'package:res_final/pages/ecom_home_screen.dart';
import 'package:res_final/pages/foodInformation.dart';
import 'package:res_final/pages/tableinformation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: EcomHomeScreen(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: Text("Home",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          Image.asset("images/banner-2.jpg"),

          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              padding: EdgeInsets.all(20),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              primary: false,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(8),
                  child: SizedBox.fromSize(
                    size: Size(80, 80),
                    child: ClipOval(
                      child: Material(
                        color: Colors.orange,
                        child: InkWell(
                          splashColor: Colors.green,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.fastfood,
                                size: 50,
                              ),
                              Text(
                                "Food Menu",
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
                  ),
                ),


                Container(
                  padding: EdgeInsets.all(8),
                  child: SizedBox.fromSize(
                    size: Size(80, 80),
                    child: ClipOval(
                      child: Material(
                        color: Colors.orange,
                        child: InkWell(
                          splashColor: Colors.green,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.table_restaurant_outlined,
                                size: 50,
                              ),
                              Text(
                                "Table",
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
                  ),
                ),


                Container(
                  padding: EdgeInsets.all(8),
                  child: SizedBox.fromSize(
                    size: Size(80, 80),
                    child: ClipOval(
                      child: Material(
                        color: Colors.orange,
                        child: InkWell(
                          splashColor: Colors.green,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.emoji_food_beverage_rounded,
                                size: 50,
                              ),
                              Text(
                                "Desert",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Page1()));
                          },
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.ac_unit),
        tooltip: "GO HOME",
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Page1()));
        },
      ),
    );
  }
}
