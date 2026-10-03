import 'dart:convert';

import 'package:db_project/main.dart';
import 'package:db_project/navbar.dart';
import 'package:db_project/showall.dart';
import 'package:db_project/signup.dart';
import 'package:db_project/student.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;




List<Student> objectsFromJson(String str) =>
    List<Student>.from(json.decode(str).map((x) => Student.fromJson(x)));

String objectsTojson(List<Student> data) =>
    json.encode(List<Student>.from(data.map((x) => x.toJson())));





class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _id= TextEditingController();
  TextEditingController _name= TextEditingController();
  Future<Student> loginStudent() async{
    Student s =Student(id: int.parse(_id.text), name: _name.text, email: "", round: "");
    final responce =await http.post(
      Uri.parse('http://172.30.64.1:8080/login'),
      body: jsonEncode(s.toJson()),
      headers: {
        "content-type": "application/json"
      },
    );
    if(responce.statusCode==200){
      return Student.fromJson(jsonDecode(responce.body));
    }else{
      throw Exception("Error");
    }
    return s;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text("Log in"),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: _id,
                  decoration: InputDecoration(
                    labelText: 'ID',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: _name,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.all(5),
              //   child: TextFormField(
              //     controller: _email,
              //     decoration: InputDecoration(
              //       labelText: 'Email',
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(5),
              //       ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.all(5),
              //   child: TextFormField(
              //     controller: _round,
              //     decoration: InputDecoration(
              //       labelText: 'Round',
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(5),
              //       ),
              //     ),
              //   ),
              // ),
              ElevatedButton(
                onPressed: () async {
                  Student s = await loginStudent();
                  if(s != null && s.id == int.parse(_id.text) && s.name==_name.text && s.round=="58") {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => Signup()));
                  }else if(s != null && s.id == int.parse(_id.text) && s.name==_name.text && s.round=="57") {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => Showall()));
                  } else{
                    SnackBar snk =
                    SnackBar(content: Text("Enter Correct Informatin"));
                    ScaffoldMessenger.of(context).showSnackBar(snk);
                  }

                  },
                child: Text("Log In"),
              ),
              // ElevatedButton(
              //   onPressed: () async {
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (context) => Showall()));
              //     Student st = await signupStudent();
              //     if (st != null) {
              //       Navigator.push(context,
              //           MaterialPageRoute(builder: (context) => Showall()));
              //     } else if (_id.text.length == 0) {
              //       SnackBar snk =
              //       SnackBar(content: Text("Enter Correct Informatin"));
              //       ScaffoldMessenger.of(context).showSnackBar(snk);
              //     }
              //   },
              //   child: Text("Show All"),
              // ),
              // ElevatedButton(
              //   onPressed: () async {
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (context) => Login()));
              //     Student st = await signupStudent();
              //     if (st != null) {
              //       Navigator.push(context,
              //           MaterialPageRoute(builder: (context) => Login()));
              //     } else if (_id.text.length == 0) {
              //       SnackBar snk =
              //       SnackBar(content: Text("Enter Correct Informatin"));
              //       ScaffoldMessenger.of(context).showSnackBar(snk);
              //     }
              //   },
              //   child: Text("Log in"),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
