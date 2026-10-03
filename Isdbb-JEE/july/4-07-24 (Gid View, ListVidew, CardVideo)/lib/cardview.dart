import 'package:flutter/material.dart';
import 'package:navigation_drawer/main.dart';
import 'package:navigation_drawer/student.dart';

class Cardview extends StatelessWidget {
  const Cardview({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Card View',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage1(),
    );
  }
}

class MyHomePage1 extends StatefulWidget {
  const MyHomePage1({super.key});

  @override
  State<MyHomePage1> createState() => _MyHomePage1State();
}

class _MyHomePage1State extends State<MyHomePage1> {

  List<Student> stList = [
    Student("Aziz","Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard", "https://e7.pngegg.com/pngimages/119/921/png-clipart-flower-dahlia-flower-flower-garden-annual-plant-thumbnail.png"),
    Student("Shamim","Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard", "https://img.freepik.com/free-psd/3d-pink-flower-isolated-transparent-background_191095-16624.jpg"),
    Student("Sazid","Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard", "https://i.pinimg.com/736x/c3/cf/61/c3cf613a2af563e8478d201a925da6cd.jpg"),
    Student("arif","Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5wy7KnWI_e3n41u5oRTzbSobfMB7PCEjReA&s"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Card View"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: stList.length,
        itemBuilder: (BuildContext context, int index){
          return Center(
            child: Card(
              elevation: 50,
              shadowColor: Colors.black,
              color: Colors.amber[100],
              child: SizedBox(
                width: 300,
                height: 500,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 100,
                        backgroundImage: NetworkImage(stList[index].photo.toString()),
                      ),
                      SizedBox(height: 10,),

                      Text(stList[index].name.toString(),style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),),
                      SizedBox(height: 10,),
                      
                      Text(stList[index].details.toString(),style: TextStyle(
                        fontSize: 15,
                        // fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),),

                      SizedBox(height: 20,),
                      SizedBox(
                        width: 300,
                        child: ElevatedButton(
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Back To Home"),
                              ],
                            ),
                          ),
                          onPressed: () {  },
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(Colors.green),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.home),
        tooltip: "Go Home",
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
        },
      ),
    );
  }
}
