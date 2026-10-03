import 'dart:convert';

import 'package:db_project/navbar.dart';
import 'package:db_project/student.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

List<Student> objectsFromJson(String str)=>List<Student>.from(json.decode(str).map((x)=> Student.fromJson(x)));
String objectsToJson(List<Student> data)=>json.encode(List<Student>.from(data).map((x)=>x.toJson()));

class Searchid extends StatefulWidget {
  const Searchid({super.key});

  @override
  State<Searchid> createState() => _SearchidState();
}

class _SearchidState extends State<Searchid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text("Search By Id"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 200,
            child: FutureBuilder<List<Student>>(
              future: showallbyID(_id.text),
              builder: (context,snapshot){
                if(snapshot.hasData){
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context,index){
                      return ListTile(
                        leading: Text(_students[index].name.toString()),
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
          ),
        ],
      ),
    );
  }
}


TextEditingController _id=TextEditingController();
String? searchid="";
late List<Student> _students=[];

Future<List<Student>> showall() async {
  final response=await http.get(
    Uri.parse('http://172.29.80.1:8080/students'),
  );
  if(response.statusCode==200){
    return objectsFromJson(response.body);
  }else{
    throw Exception("Failed");
  }
}
void show() async{
  _students=await showall();
}

Future<List<Student>> showallbyID(String id) async {
  var response;
  if(id.length==0){
    response=await http.get(
      Uri.parse('http://172.29.80.1:8080/students'),
    );
  }else{
    response=await http.get(
      Uri.parse('http://172.29.80.1:8080/students'),
    );
  }
  if(response.statusCode==200){
    return objectsFromJson(response.body);
  }else{
    throw Exception("Failed");
  }
}
void showbyId() async{
  _students=await showallbyID(_id.text);

}


