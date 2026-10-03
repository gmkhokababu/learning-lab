import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student/main.dart';
import 'package:student/showall.dart';
import 'package:student/student.dart';

List<Student> objectsFromJson(String str) =>
    List<Student>.from(json.decode(str).map((x) => Student.fromJson(x)));
objectsToJson(List<Student> data) =>
    json.encode(List<Student>.from(data.map((x) => x.toJson())));




class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _id = TextEditingController();
  TextEditingController _name = TextEditingController();

  Future<Student> loginstudent()async{
    Student s = Student(id: int.parse(_id.text), name: _name.text, email: "", round: "");
    final response = await http.post(
      Uri.parse('http://192.168.0.70:8080/login'),
      body: jsonEncode(s.toJson()),
        headers: {
          "content-type":"application/json"

        }
    );



    if(response.statusCode == 200){
     return Student.fromJson(jsonDecode(response.body));

    } else {
      throw Exception("Error");

    }


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
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
                    labelText: "id",
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
                    labelText: "Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),


              ElevatedButton(
                child: Text("Login"),
                onPressed: () async{
                  Student s = await loginstudent();


                  if(s != null && s.id == int.parse(_id.text) && (s.name == _name.text)){
                    if(s.round == "admin"){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Showall()));
                    }else if(s.round == "user"){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
                    }

                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Showall()));
                  }else{
                    SnackBar snk = SnackBar(content: Text("enter Correct information"));
                    ScaffoldMessenger.of(context).showSnackBar(snk);
                  }



                },
              ),





            ],
          ),
        ),
      ),
    );
  }
}
