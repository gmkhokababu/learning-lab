<<<<<<< HEAD
=======
// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

>>>>>>> 8dbe443f6ae28a323e9517fc79d7479d185d5c9b
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
<<<<<<< HEAD

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
=======
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
>>>>>>> 8dbe443f6ae28a323e9517fc79d7479d185d5c9b
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
<<<<<<< HEAD

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

=======
  final String title;
>>>>>>> 8dbe443f6ae28a323e9517fc79d7479d185d5c9b
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
<<<<<<< HEAD

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
=======
  bool isChecked = false;
  String? g = "";
  String? dd="web";
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  void _incrementCounter() {
    setState(() {
>>>>>>> 8dbe443f6ae28a323e9517fc79d7479d185d5c9b
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
=======
    return Scaffold(
      // appBar: AppBar(
      //   // TRY THIS: Try changing the color here to a specific color (to
      //   // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
      //   // change color while the other colors stay the same.
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: t1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "1st Number",
                hintText: "Input Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              // obscureText: true,
              controller: t2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "2nd Number",
                // hintText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              readOnly: true,
              // obscureText: true,
              controller: t3,
              decoration: InputDecoration(
                labelText: "Result",
                // hintText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: isChecked,
                onChanged: (bool? val) {
                  setState(() {
                    isChecked = val ?? false;
                    Message(isChecked.toString());
                  });
                },
              ),
              Text("Check me"),
            ],
          ),
          Row(
            children: [
              Radio<String>(
                  value: 'female',
                  groupValue: g,
                  onChanged: (String? value) {
                    setState(() {
                      g = value;
                      Message(g.toString());
                    });
                  }),
              Text("Female"),
              Radio<String>(
                  value: 'male',
                  groupValue: g,
                  onChanged: (String? value) {
                    setState(() {
                      g = value;
                      Message(g.toString());
                    });
                  }),
              Text("Male"),
              Radio<String>(
                  value: 'other',
                  groupValue: g,
                  onChanged: (String? value) {
                    setState(() {
                      g = value;
                    });
                  }),
              Text("Other"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
                    child: Text("Video"),
                    value: "video",
                  ),
                  DropdownMenuItem<String>(
                    child: Text("MP3"),
                    value: "mp3",
                  ),
                ],
                onChanged: (String? value) {
                  setState(() {
                    dd = value;
                    Message(dd.toString());
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    // t3.text=t1.text+" "+t2.text;
                    var result = int.parse(t1.text) + int.parse(t2.text);
                    t3.text = result.toString();
                    SnackBar s = SnackBar(
                      content: Text(result.toString()),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(s);
                  },
                  child: Text(
                    "Add",
                  ),
                ),
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    // t3.text=t1.text+" "+t2.text;
                    var result = int.parse(t1.text) - int.parse(t2.text);
                    t3.text = result.toString();
                    SnackBar s = SnackBar(
                      content: Text(result.toString()),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(s);
                  },
                  child: Text(
                    "Min",
                  ),
                ),
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    // t3.text=t1.text+" "+t2.text;
                    var result = int.parse(t1.text) * int.parse(t2.text);
                    t3.text = result.toString();
                    SnackBar s = SnackBar(
                      content: Text(result.toString()),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(s);
                  },
                  child: Text(
                    "Multi",
                  ),
                ),
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    // t3.text=t1.text+" "+t2.text;
                    var result = int.parse(t1.text) / int.parse(t2.text);
                    t3.text = result.toString();
                    SnackBar s = SnackBar(
                      content: Text(result.toString()),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(s);
                  },
                  child: Text(
                    "Div",
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void Message(String m) {
    SnackBar s = new SnackBar(content: Text(m));
    ScaffoldMessenger.of(context).showSnackBar(s);
  }
>>>>>>> 8dbe443f6ae28a323e9517fc79d7479d185d5c9b
}
