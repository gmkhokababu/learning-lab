import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:res_final/adminnav.dart';
import 'package:res_final/main.dart';
import 'package:http/http.dart' as http;
import '../model/user.dart';
import 'ip.dart';


List<User> objectsFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));
objectsToJson(List<User> data) =>
    json.encode(List<User>.from(data.map((x) => x.toJson())));

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _id = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();

  Future<User> signupUser() async {
    User u = User(
        admin_id: int.parse(_id.text),
        admin_name: _name.text,
        admin_email: _email.text,
        admin_pass: _pass.text);

    Ip ip = Ip();
    final response = await http.post(
        Uri.parse(ip.ipAddress +'/registration'),
        body: jsonEncode(u.toJson()),
        headers: {
          "content-type":"application/json"

        }

    );

    if(response.statusCode == 200){
      return User.fromJson(jsonDecode(response.body));

    } else {
      throw Exception("Error");

    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Adminnav(),
      appBar: AppBar(
        title: Text("Register"),
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
              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: _email,
                  decoration: InputDecoration(
                    labelText: "email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: _pass,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                child: Text("Sign up"),
                onPressed: () async {

                  User st = await signupUser();
                  if(st != null){

                    SnackBar snk = SnackBar(content: Text("Registration Successfull"));
                    ScaffoldMessenger.of(context).showSnackBar(snk);

                    // Navigator.push(
                    //     context, MaterialPageRoute(builder: (context) => MyApp()));

                  }else if (_id.text.length == 0){
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
