import 'package:flutter/material.dart';
import 'package:navigation_drawer/Nav_bar.dart';
import 'package:navigation_drawer/main.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Profile",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage1(title: 'Hello Navigation'),
    );
  }
}

class MyHomePage1 extends StatefulWidget {
  const MyHomePage1({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage1> createState() => _MyHomePage1State();
}

class _MyHomePage1State extends State<MyHomePage1> {
  List<String> student=["Rahim","Karim","Shamim","Sazid","Sajib","Rahat","Arif"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Profile"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: student.length,
        itemBuilder: (BuildContext context, int index){
          return Container(
            margin: EdgeInsets.all(2),
            height: 50,
            color: Colors.amber[500],
            child: Center(
              child: Text(student[index]),
            ),
          );
        }
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon((Icons.arrow_left)),
      //   tooltip: "Grow Home Page",
      //   onPressed: (){
      //     Navigator.push(context,MaterialPageRoute(builder: (context) =>MyApp()));
      //   },
      // ),
    );
  }
}

