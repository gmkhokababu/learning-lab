import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:real_state_management/all_nav/owner_nav.dart';
import 'package:real_state_management/extension/string_extension.dart';
import 'package:real_state_management/model/ipaddress.dart';
import 'package:real_state_management/model/tenant.dart';
import 'package:http/http.dart' as http;
import 'package:real_state_management/owner/save_shedule.dart';


List<Tenant> objectsFromJson(String str)=>List<Tenant>.from(json.decode(str).map((x)=>Tenant.fromJson(x)));
String objectsToJson(List<Tenant> data)=>json.encode(List<Tenant>.from(data).map((x)=>x.toJson()));

class NotificationDetails extends StatefulWidget {
  final int? tenantId;
  const NotificationDetails({super.key, this.tenantId});

  @override
  State<NotificationDetails> createState() => _NotificationDetailsState();
}

class _NotificationDetailsState extends State<NotificationDetails> {
  String? _tenantId;
  Ipaddress i=Ipaddress();
  late List<Tenant> _tenant=[];
  Future<List<Tenant>> showall()async{
    final response=await http.get(
      Uri.parse('${i.ip}tenant/'+_tenantId.toString()),
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
  void initState() {
    // TODO: implement initState
    _tenantId=widget.tenantId.toString();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: OwnerNav(),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body:ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: FutureBuilder<List<Tenant>>(
                future: showall(),
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    _tenant=snapshot.data!;
                    // SnackBar s= SnackBar(content: Text("Get Data"));
                    // ScaffoldMessenger.of(context).showSnackBar(s);
                    return ListView.builder(
                      padding: EdgeInsets.all(8),
                      itemCount: _tenant.length,
                      itemBuilder: (BuildContext context, int index){
                        return Center(
                          child: Card(
                            elevation: 50,
                            shadowColor: Colors.black,
                            color: Colors.blueAccent,
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
                                      height:50,
                                    ),
                                    Text(
                                      "Name: "+_tenant[index].name.toString().capitalize(),
                                      style: TextStyle(
                                        fontSize: 30,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      "Present Address: "+_tenant[index].presentAddress.toString().capitalize(),
                                      style: TextStyle(
                                        fontSize: 23,
                                      ),
                                    ),
                                    Text(
                                      "Permanent Address: "+_tenant[index].permanentAddress.toString().capitalize(),
                                      style: TextStyle(
                                        fontSize: 23,
                                      ),
                                    ),
                                    Text(
                                      "Occupation: "+_tenant[index].occupation.toString().capitalize(),
                                      style: TextStyle(
                                        fontSize: 23,
                                      ),
                                    ),
                                    SizedBox(
                                      height:50,
                                    ),

                                    // Text(
                                    //   _property[index].amenities.toString().capitalize(),
                                    //   style: TextStyle(
                                    //     fontSize: 23,
                                    //   ),
                                    //   textAlign: TextAlign.center,
                                    // ),
                                    ElevatedButton(
                                        onPressed: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SaveShedule()));
                                        },

                                        child: Text(
                                          "Save Shedule ",
                                          style: TextStyle(
                                            fontSize: 25,
                                            letterSpacing: 1,
                                            wordSpacing: 1,
                                            // backgroundColor: Colors.blue,
                                            color: Colors.black,
                                          ),

                                        )

                                    ),
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
    );
  }
}
