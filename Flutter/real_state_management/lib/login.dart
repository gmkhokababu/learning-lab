import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:real_state_management/model/user.dart';
import 'package:http/http.dart' as http;


List<User> objectsFromJson(String str)=>List<User>.from(json.decode(str).map((x)=>User.fromJson(x)));
String objectsToJson(List<User> data)=>json.encode(List<User>.from(data).map((x)=>x.toJson()));

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _userName=TextEditingController();
  TextEditingController _password=TextEditingController();
  Future<User> loginAdmin() async{
    final responce = await http.get(Uri.parse('http://192.168.0.73:8080/'+_userName.toString()+'/'+_password.toString()));
    if(responce.statusCode==200){
      return User.fromJson(jsonDecode(responce.body));
    }else{
      throw Exception("Error");
    }

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Hello Login")
          ],
        ),
      ),
    );
  }
}
