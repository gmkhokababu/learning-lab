import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:res_final/customerNav.dart';
import 'package:res_final/main.dart';
import 'package:res_final/model/user.dart';
import 'package:res_final/navbar.dart';
import 'package:res_final/pages/admindashboard.dart';
import 'package:res_final/pages/customerDashboard.dart';
import 'package:res_final/pages/ecom_home_screen.dart';

import 'ip.dart';

List<User> objectsFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));
objectsToJson(List<User> data) =>
    json.encode(List<User>.from(data.map((x) => x.toJson())));

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _id = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();

  Future<User> loginUser() async {
    User u = User(
        admin_id: int.parse(_id.text),
        admin_name: _name.text,
        admin_email: _email.text,
        admin_pass: _pass.text);
    Ip ip = Ip();
    final response = await http.post(
        Uri.parse(ip.ipAddress+'/login'),
        body: jsonEncode(u.toJson()),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink,
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
                  obscureText: true,
                  controller: _pass,
                  decoration: InputDecoration(
                    labelText: "Pass",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                child: Text("Login"),
                onPressed: () async {
                  User u = await loginUser();

                  if (u != null &&
                      u.admin_id == int.parse(_id.text) &&
                      (u.admin_pass == _pass.text)) {
                    if(u.admin_id! > 500){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Customerdashboard()));
                    }else{
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Admindashboard()));
                    }


                  } else {
                    SnackBar snk =
                        SnackBar(content: Text("Wrong UserId or Password"));
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
