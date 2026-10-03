

import 'package:flutter/material.dart';
import 'package:navigation_drawer/Nav_bar.dart';
import 'package:navigation_drawer/student.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Home 2",
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
  List<Student> stList=[
    Student("Belly", "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy", "data:image/jpeg;base64,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"),
    Student("Jue", "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy", "data:image/jpeg;base64,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"),
    Student("Chameli", "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRi6njX-az6wv_afhIsCMra14UgJ7DOKCMpOw&s"),



  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Home 2"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: stList.length,
        itemBuilder: (BuildContext context, int index) {
             return Center(
               child: Card(
                 elevation: 50,
                 shadowColor: Colors.black,
                 color: Colors.amber[500],
                 child: SizedBox(
                   width: 300,
                   height: 500,
                   child: Padding(
                     padding: EdgeInsets.all(8),
                     child: Column(
                       children: <Widget>[
                         CircleAvatar(
                           radius: 100,
                           // backgroundImage: Image.asset("images/flower.png"),
                           backgroundImage: NetworkImage(stList[index].photo.toString()),
                         ),
                         SizedBox(
                           height: 10,
                         ),
                         Text(stList[index].name.toString(),
                         style: TextStyle(
                           fontSize: 30,
                           fontWeight: FontWeight.bold,
                           color: Colors.black,
                         ),
                         ),
                         SizedBox(
                           height: 10,
                         ),
                         Text(stList[index].details.toString(),
                           style: TextStyle(
                             fontSize: 15,
                             color: Colors.black,
                           ),
                         ),
                         SizedBox(
                           child: ElevatedButton(
                             child: Padding(
                               padding: EdgeInsets.all(5),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: <Widget>[
                                   Text("Show Details"),
                                 ],

                               ),
                             ),
                             onPressed: (){

                             },
                             style: ButtonStyle(
                               backgroundColor: WidgetStateProperty.all(Colors.black)
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),
               ),
             );
        },
      ),
    );
  }
}

