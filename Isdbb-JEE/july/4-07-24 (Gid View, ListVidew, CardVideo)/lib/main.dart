import 'package:flutter/material.dart';
import 'package:navigation_drawer/cardview.dart';
import 'package:navigation_drawer/navbar.dart';
import 'package:navigation_drawer/page1.dart';

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
  bool? x = true;
  String? g = "";
  String? dd = "web";

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
        title: Text('Navigation Drawer App'),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          Text("This Is Home Page"),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.email,
                                size: 50,
                              ),
                              Text(
                                "List View",
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

                Container(
                  padding: EdgeInsets.all(8),
                  child: SizedBox.fromSize(
                    size: Size(80, 80),
                    child: ClipOval(
                      child: Material(
                        color: Colors.orange,
                        child: InkWell(
                          splashColor: Colors.green,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.card_membership,
                                size: 50,
                              ),
                              Text(
                                "Card View",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Cardview()));
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.email,
                                size: 50,
                              ),
                              Text(
                                "Contact",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.email,
                                size: 50,
                              ),
                              Text(
                                "Contact",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.email,
                                size: 50,
                              ),
                              Text(
                                "Contact",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.email,
                                size: 50,
                              ),
                              Text(
                                "Contact",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.email,
                                size: 50,
                              ),
                              Text(
                                "Contact",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.email,
                                size: 50,
                              ),
                              Text(
                                "Contact",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.email,
                                size: 50,
                              ),
                              Text(
                                "Contact",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.email,
                                size: 50,
                              ),
                              Text(
                                "Contact",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
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
