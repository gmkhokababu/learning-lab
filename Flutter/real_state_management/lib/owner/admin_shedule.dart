import 'package:flutter/material.dart';
import 'package:real_state_management/all_nav/owner_nav.dart';

class AdminShedule extends StatefulWidget {
  const AdminShedule({super.key});

  @override
  State<AdminShedule> createState() => _AdminSheduleState();
}

class _AdminSheduleState extends State<AdminShedule> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      drawer: OwnerNav(),
      appBar: AppBar(),
      body: Center(
        child: Text("hello Admin Shediul"),
      ),
    );
  }
}
