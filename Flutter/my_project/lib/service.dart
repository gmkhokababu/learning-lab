import 'package:flutter/material.dart';
import 'package:my_project/nav_bar.dart';

class MyService extends StatelessWidget {
  const MyService({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyAppService(title: ' Service'),
    );
  }
}

class MyAppService extends StatefulWidget {
  const MyAppService({super.key, required this.title});

  final String title;
  @override
  State<MyAppService> createState() => _MyServiceState();
}

class _MyServiceState extends State<MyAppService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("WelCome service")
          ],
        ),
      ),
    );
  }
}
