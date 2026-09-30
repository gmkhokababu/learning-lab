import 'package:flutter/material.dart';
import 'package:real_state_management/all_nav/owner_nav.dart';

class AddListing extends StatefulWidget {
  const AddListing({super.key});

  @override
  State<AddListing> createState() => _AddListingState();
}

class _AddListingState extends State<AddListing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: OwnerNav(),
      appBar: AppBar(),
      body: Center(
        child: Text("hello Add Listing"),
      ),
    );
  }
}
