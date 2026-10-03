import 'package:flutter/material.dart';
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
      body: Center(
          child: Text(
        'Main Page',
        style: TextStyle(fontSize: 40),
      )),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        tooltip: "GO HOME",
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Page1()));
        },
      ),
    );
  }
}
