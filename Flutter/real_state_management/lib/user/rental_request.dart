import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:real_state_management/all_nav/home_nav.dart';
import 'package:real_state_management/model/ipaddress.dart';
import 'package:real_state_management/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:real_state_management/owner/owner.dart';

class RentalRequests extends StatelessWidget {
  const RentalRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


class RentalRequest extends StatefulWidget {

  const RentalRequest({super.key,required this.propertyNo, required this.landloardId});
  final String propertyNo;
  final String landloardId;
  @override
  State<RentalRequest> createState() => _RentalRequestState();
}

class _RentalRequestState extends State<RentalRequest> {
  String? _propertyId;
  String? _landloardId;
  TextEditingController _name=TextEditingController();
  TextEditingController _phoneNo=TextEditingController();
  TextEditingController _email=TextEditingController();
  TextEditingController _presentAddress=TextEditingController();
  TextEditingController _permanentAddress=TextEditingController();
  TextEditingController _occupation=TextEditingController();
  TextEditingController _userName=TextEditingController();
  TextEditingController _password=TextEditingController();
  Ipaddress i= Ipaddress();


  Future<User> loginAdmin() async{
    final responce = await http.get(Uri.parse('${i.ip}${_userName.text}/${_password.text}'));
    if(responce.statusCode==200){
      return User.fromJson(jsonDecode(responce.body));
    }else{
      throw Exception("Error");
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    _propertyId=widget.propertyNo.toString();
    _landloardId=widget.landloardId.toString();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeNav(),
      appBar: AppBar(),
      body:  Form(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: _name,
                  decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      )
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: _phoneNo,
                  decoration: InputDecoration(
                      labelText: 'Phone No',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      )
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
                      )
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: _presentAddress,
                  decoration: InputDecoration(
                      labelText: 'Present Address',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      )
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: _permanentAddress,
                  decoration: InputDecoration(
                      labelText: 'Permanent Address',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      )
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: _occupation,
                  decoration: InputDecoration(
                      labelText: 'Occupation',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      )
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: _userName,
                  decoration: InputDecoration(
                      labelText: 'User Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      )
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: _password,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      )
                  ),
                ),
              ),
              ElevatedButton(onPressed: () async{
                // String? username=_userName.text.toString();
                // String? password=_password.text.toString();
                // SnackBar ss= SnackBar(content: Text('http://192.168.0.73:8080/'+username+'/'+password));
                // ScaffoldMessenger.of(context).showSnackBar(ss);
                User u=await loginAdmin();
                if (u!=null && u.role=="landowner"){

                  // SnackBar s= SnackBar(content: Text("Login success"));
                  // ScaffoldMessenger.of(context).showSnackBar(s);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Owner()));
                }else{
                  SnackBar s= SnackBar(content: Text("Login faild"));
                  ScaffoldMessenger.of(context).showSnackBar(s);
                };
              },
                  child: Text("Submit")
              ),
            ],
          ),
        ),
      ),
    );
  }
}
