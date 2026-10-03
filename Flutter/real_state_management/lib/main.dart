import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:real_state_management/all_nav/home_nav.dart';
import 'package:real_state_management/model/ipaddress.dart';
import 'package:real_state_management/model/property.dart';

import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}


List<Property> objectsFromJson(String str)=>List<Property>.from(json.decode(str).map((x)=>Property.fromJson(x)));
String objectsToJson(List<Property> data)=>json.encode(List<Property>.from(data).map((x)=>x.toJson()));



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rental Property',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Real Estate Management'),
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
  Ipaddress i=Ipaddress();
late List<Property> _property=[];
Future<List<Property>> showall()async{
  final response=await http.get(
    Uri.parse(i.ip.toString()+'getproperty'),
  );
  if(response.statusCode==200){
    SnackBar s= SnackBar(content: Text("Get Data"));
    ScaffoldMessenger.of(context).showSnackBar(s);
    return objectsFromJson(response.body);
  }else{
    throw Exception("Failed");
  }
}



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: HomeNav(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder<List<Property>>(
              future: showall(),
              builder: (context, snapshot){
                if(snapshot.hasData){
                  _property=snapshot.data!;
                  SnackBar s= SnackBar(content: Text("Get Data"));
                  ScaffoldMessenger.of(context).showSnackBar(s);
                  return ListView.builder(
                    padding: EdgeInsets.all(8),
                    itemCount: _property.length,
                    itemBuilder: (BuildContext context, int index){
                      return Center(
                        child: Card(
                          elevation: 50,
                          shadowColor: Colors.black,
                          color: Colors.amber[500],
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                children: <Widget>[
                                  // CircleAvatar(
                                  //     radius: 100,
                                  //     backgroundImage: NetworkImage('https://www.loans.com.au/dA/9de8aa8d51/what-factors-affect-property-value.png')
                                  // ),
                                  SizedBox(
                                    height:10,
                                  ),
                                  Text(_property[index].type.toString()+" For")
                                ],

                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }else if(snapshot.hasError){
                  return Text("Error");
                }else{
                  return CircularProgressIndicator();
                }
              },
            ),
          )
        ],
      ),



      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
