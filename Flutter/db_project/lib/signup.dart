import 'dart:convert';

import 'package:db_project/login.dart';
import 'package:db_project/main.dart';
import 'package:db_project/navbar.dart';
import 'package:db_project/showall.dart';
import 'package:db_project/student.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

List<Student> objectsFromJson(String str) =>
    List<Student>.from(json.decode(str).map((x) => Student.fromJson(x)));

String objectsTojson(List<Student> data) =>
    json.encode(List<Student>.from(data.map((x) => x.toJson())));

main(){
  runApp(MaterialApp(
    home:Signup() ,
  ),
  );
}

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  int x=0;
  TextEditingController _id = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _round = TextEditingController();
  Future<Student> signupStudent() async {
    Student s = Student(
        id: int.parse(_id.text),
        name: _name.text,
        email: _email.text,
        round: _round.text);
    final response =
        await http.post(Uri.parse('http://172.30.64.1:8080/insert'),
            body: jsonEncode(
              s.toJson(),
            ),
            headers: {"content-type": "application/json"});
    if (response.statusCode == 200) {
      return Student.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text("Signup"),
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
              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: _email,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: _round,
                  decoration: InputDecoration(
                    labelText: 'Round',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  Student st = await signupStudent();
                  if (st != null) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyApp()));
                  } else if (_id.text.length == 0) {
                    SnackBar snk =
                        SnackBar(content: Text("Enter Correct Informatin"));
                    ScaffoldMessenger.of(context).showSnackBar(snk);
                  }
                },
                child: Text("Signup"),
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Showall()));
                  Student st = await signupStudent();
                  if (st != null) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Showall()));
                  } else if (_id.text.length == 0) {
                    SnackBar snk =
                    SnackBar(content: Text("Enter Correct Informatin"));
                    ScaffoldMessenger.of(context).showSnackBar(snk);
                  }
                },
                child: Text("Show All"),
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                  Student st = await signupStudent();
                  if (st != null) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  } else if (_id.text.length == 0) {
                    SnackBar snk =
                    SnackBar(content: Text("Enter Correct Informatin"));
                    ScaffoldMessenger.of(context).showSnackBar(snk);
                  }
                },
                child: Text("Log in"),
              ),
              ElevatedButton(
                onPressed: ()  {
                  x=x+1;
                  setState(() {

                  });
                },
                child: Text("submit"),
              ),
              Text("Hello "+(x.toString()))
            ],
          ),
        ),
      ),
    );
  }
}
// String? x="Abu Hossain";
