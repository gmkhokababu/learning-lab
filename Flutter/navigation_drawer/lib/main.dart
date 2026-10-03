import 'package:flutter/material.dart';
import 'package:navigation_drawer/Nav_bar.dart';
import 'package:navigation_drawer/home.dart';
import 'package:navigation_drawer/page1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Hello Navigation'),
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
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Text("Hello Navigation"),
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
                        size: Size(80,80),
                        child: ClipOval(
                          child: Material(
                            color: Colors.orange,
                            child: InkWell(
                              splashColor: Colors.green,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.home,size: 50,),
                                  Text("Home",
                                    style: TextStyle(
                                        fontSize: 20
                                    ),
                                  ),
                                ],
                              ),
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: SizedBox.fromSize(
                        size: Size(80,80),
                        child: ClipOval(
                          child: Material(
                            color: Colors.orange,
                            child: InkWell(
                              splashColor: Colors.green,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.settings,size: 50,),
                                  Text("Settings",
                                    style: TextStyle(
                                        fontSize: 20
                                    ),
                                  ),
                                ],
                              ),
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: SizedBox.fromSize(
                        size: Size(80,80),
                        child: ClipOval(
                          child: Material(
                            color: Colors.orange,
                            child: InkWell(
                              splashColor: Colors.green,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.design_services,size: 50,),
                                  Text("All Services",
                                    style: TextStyle(
                                        fontSize: 20
                                    ),
                                  ),
                                ],
                              ),
                              onTap: (){

                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: SizedBox.fromSize(
                        size: Size(80,80),
                        child: ClipOval(
                          child: Material(
                            color: Colors.orange,
                            child: InkWell(
                              splashColor: Colors.green,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.person,size: 50,),
                                  Text("Profile",
                                    style: TextStyle(
                                        fontSize: 20
                                    ),
                                  ),
                                ],
                              ),
                              onTap: (){

                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: SizedBox.fromSize(
                        size: Size(80,80),
                        child: ClipOval(
                          child: Material(
                            color: Colors.orange,
                            child: InkWell(
                              splashColor: Colors.green,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.admin_panel_settings,size: 50,),
                                  Text("Admin",
                                    style: TextStyle(
                                        fontSize: 20
                                    ),
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
                        size: Size(80,80),
                        child: ClipOval(
                          child: Material(
                            color: Colors.orange,
                            child: InkWell(
                              splashColor: Colors.green,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.email,size: 50,),
                                  Text("Contact",
                                    style: TextStyle(
                                        fontSize: 20
                                    ),
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
      
      // floatingActionButton: FloatingActionButton(
      //   onPressed:() {Navigator.push(context, MaterialPageRoute(builder: (context) => Page1()));},
      //   tooltip: 'Grow Home Page',
      //   child: const Icon(Icons.arrow_right),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
