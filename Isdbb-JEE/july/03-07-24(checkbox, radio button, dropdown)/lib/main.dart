import 'package:flutter/material.dart';
import 'package:navigation_drawer/navbar.dart';
import 'package:navigation_drawer/page1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool? x = true;
  String? g="";
  String? dd="web";

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: Text('Navigation Drawer App'),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'you@gmail.com',
                icon: Icon(Icons.contact_mail),
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              children: [
                Checkbox(
                    value: x,
                    onChanged: (bool? value) {
                      setState(() {
                        x = value;

                      });
                    }),
                Text("Java"),
              ],
            ),
            Row(
              children: [
                Radio<String>(value: 'female', groupValue: g, onChanged: (String? value){
                  setState(() {
                    g=value;
                    SnackBar s = SnackBar(content: Text(g.toString()));
                    ScaffoldMessenger.of(context).showSnackBar(s);
                  });
                }),
                Text("Female"),
              ],
            ),
            Row(
              children: [
                Radio<String>(value: 'male', groupValue: g, onChanged: (String? value){
                  setState(() {
                    g=value;
                    SnackBar s = SnackBar(content: Text(g.toString()));
                    ScaffoldMessenger.of(context).showSnackBar(s);

                  });
                }),
                Text("Male")
              ],
            ),
            Row(
              children: [
                DropdownButton(
                  value: dd,
                    items: <DropdownMenuItem<String>>[
                      DropdownMenuItem<String>(
                          child: Text("Web"),
                        value: "web",
                      ),
                      DropdownMenuItem<String>(
                        child: Text("Image"),
                        value: "image",
                      ),
                      DropdownMenuItem<String>(
                        child: Text("News"),
                        value: "news",
                      ),
                      DropdownMenuItem<String>(
                        child: Text("Shopping"),
                        value: "shopping",
                      )
                    ],
                    onChanged: (String? value){
                    setState(() {
                      dd=value;
                      SnackBar s = SnackBar(content: Text(dd.toString()));
                      ScaffoldMessenger.of(context).showSnackBar(s);
                    });
                    }


                ),
              ],
            )



          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        tooltip: "GO HOME",
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Page1()));
        },
      ),
    );
  }
}
