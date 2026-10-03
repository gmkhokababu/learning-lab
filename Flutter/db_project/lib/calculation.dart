import 'package:db_project/navbar.dart';
import 'package:flutter/material.dart';

class Calculation extends StatefulWidget {
  const Calculation({super.key});

  @override
  State<Calculation> createState() => _CalculationState();
}

class _CalculationState extends State<Calculation> {
  TextEditingController x=TextEditingController();
  TextEditingController y=TextEditingController();
  int? sum;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
        appBar: AppBar(
          title: Text("Calculator"),
        ),
        body:  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(5),
          child: TextFormField(
            controller: x,
            decoration: InputDecoration(
              labelText: 'First Number',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: TextFormField(
            controller: y,
            decoration: InputDecoration(
              labelText: 'Second Number',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: ()  {
            sum=int.parse(x.text) +int.parse(y.text);
            setState(() {

            });
          },
          child: Text("Submit"),
        ),
        Text(sum.toString())
      ],
    ),
    );
  }
}
