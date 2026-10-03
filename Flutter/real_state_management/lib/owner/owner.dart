import 'package:flutter/material.dart';
import 'package:real_state_management/all_nav/owner_nav.dart';

class Owner extends StatefulWidget {
  const Owner({super.key});

  @override
  State<Owner> createState() => _OwnerState();
}

class _OwnerState extends State<Owner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: OwnerNav(),
      appBar: AppBar(),
      body: Center(
        child: Text("Hello Owner"),
      ),
    );
  }
}
