import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:real_state_management/all_nav/owner_nav.dart';
import 'package:real_state_management/extension/string_extension.dart';
import 'package:real_state_management/main.dart';
import 'package:real_state_management/model/ipaddress.dart';
import 'package:real_state_management/model/notification.dart';
import 'package:http/http.dart' as http;
import 'package:real_state_management/owner/notification_details.dart';


List<Notifications> objectsFromJson(String str)=>List<Notifications>.from(json.decode(str).map((x)=>Notifications.fromJson(x)));
String objectsToJson(List<Notifications> data)=>json.encode(List<Notifications>.from(data).map((x)=>x.toJson()));

class OwnerNotification extends StatefulWidget {
  const OwnerNotification({super.key});

  @override
  State<OwnerNotification> createState() => _OwnerNotificationState();
}

class _OwnerNotificationState extends State<OwnerNotification> {
  Ipaddress i=Ipaddress();
  late List<Notifications> _notification=[];
  Future<List<Notifications>> showall()async{
    final response=await http.get(
      Uri.parse('${i.ip}get-notification'),
    );
    if(response.statusCode==200){
      // SnackBar s= SnackBar(content: Text("Get Data"));
      // ScaffoldMessenger.of(context).showSnackBar(s);
      return objectsFromJson(response.body);
    }else{
      throw Exception("Failed");
    }
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: OwnerNav(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder<List<Notifications>>(
              future: showall(),
              builder: (context,snapshot){
                if(snapshot.hasData){
                  _notification=snapshot.data!;
                  return ListView.builder(
                    itemCount: _notification.length,
                      itemBuilder: (context,index){
                    return ListTile(
                      title: Text(_notification[index].notificationStatus.toString()),
                      leading: Text(_notification[index].notificationId.toString().capitalize()),
                      trailing: Text(_notification[index].propertyId.toString()),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationDetails(tenantId :int.parse(_notification[index].tenantId.toString()))));
                      },
                    );
                  },
                  );
                }else if(snapshot.hasError){
                  return Text("Notification Error");
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
