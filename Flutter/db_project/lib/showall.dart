import 'package:db_project/navbar.dart';
import 'package:db_project/student.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


List<Student> objectsFromJson(String str)=>List<Student>.from(json.decode(str).map((x)=> Student.fromJson(x)));
String objectsToJson(List<Student> data)=>json.encode(List<Student>.from(data).map((x)=>x.toJson()));



// main(){
//   runApp(MaterialApp(
//     home:Showall() ,
//   ),
//   );
// }

class Showall extends StatefulWidget {
  const Showall({super.key});

  @override
  State<Showall> createState() => _ShowallState();
}

class _ShowallState extends State<Showall> {

  late List<Student> _students=[];
  Future<List<Student>> showall() async {
    final response=await http.get(
      Uri.parse('http://172.30.64.1:8080/students'),
    );
    if(response.statusCode==200){
      return objectsFromJson(response.body);
    }else{
      throw Exception("Failed");
    }
  }

  // @override
  // void initState() {
  //   showall();
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text("All Data"),
      ),
      body: ListView(
        children: [
          Container(
            height: 400,
            child: FutureBuilder<List<Student>>(
              future:showall(),
              builder:(context,snapshot){

                if(snapshot.hasData){
                  _students=snapshot.data!;
                  return ListView.builder(
                    itemCount:snapshot.data!.length,
                    itemBuilder: (context,index){


                      return ListTile(
                        title: Text(_students[index].id.toString()),
                        leading: Text(_students[index].name.toString()),
                        subtitle: Text(_students[index].email.toString()),
                        trailing: Text(_students[index].round.toString()),

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
