import 'package:flutter/material.dart';

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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomPadding: false,
      // resizeToAvoidBottomInset: false,
      //   appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text(widget.title),
      //
      // ),
      body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Material(
          child: Container(
             // weidth:MainQuery.of(context).size.weidth,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/1.6,
                      decoration: BoxDecoration(
                        color: Color(0xFfffffff),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/1.6,
                      decoration: BoxDecoration(
                        color: Color(0xFF674AEF),
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(70)),
                      ),
                      child: Center(child: Image.asset("images/books.png", scale: 0.8,),),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/2.666,
                    decoration: BoxDecoration(
                      color: Color(0xFF674AEF),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/2.666,
                    padding: EdgeInsets.only(top: 40,bottom: 30),
                    decoration: BoxDecoration(
                      color: Color(0xFfffffff),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(70))
                    ),
                    child: Column(
                      children: [
                        Text(
                            "Learning is Everything",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                            wordSpacing: 2,
                          ),
                        ),
                        SizedBox(height: 15,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: Text("Learning with Pleasure with Dear Programmer, Wherever you are.",
                          textAlign: TextAlign.center,
                            style: TextStyle(
                            fontSize: 17,
                            color: Color(0xFf000000).withOpacity(0.6),
                          ),
                          ),
                        ),
                      SizedBox(height: 60,),
                        Material(
                          color: Color(0xFF674AEF),
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: (){},
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 15,horizontal: 80
                              ),
                              child: Text(
                                "Get Start",
                                style: TextStyle(
                                  color: Color(0xFfffffff),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
           ),
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
}
