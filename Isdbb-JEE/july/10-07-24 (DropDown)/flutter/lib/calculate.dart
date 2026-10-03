import 'package:flutter/material.dart';

class Calculate extends StatefulWidget {
  const Calculate({super.key});

  @override
  State<Calculate> createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  int _counter = 0;
  int sum =0;

  String? g = "";
  String? dd = "web";

  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: t1,
                decoration: InputDecoration(
                  labelText: "1st Number",
                  hintText: "Input Number",
                  icon: Icon(Icons.edit_square),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                // obscureText: true,
                controller: t2,
                decoration: InputDecoration(
                  labelText: "2nd Number",
                  hintText: "Input Number",
                  icon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
            ),


            SizedBox(
              height: 10,
            ),

            ElevatedButton(
              onPressed: () {
                int x = int.parse(t1.text);
                int y = int.parse(t2.text);
                if (dd== 'web') {
                  sum = x + y;
                }else if(dd== 'image'){

                  sum = x - y;
                }

                // t3.text= t1.text+t2.text;
                t3.text = sum.toString();

                SnackBar s = SnackBar(
                  content: Text(sum.toString()),
                );
                ScaffoldMessenger.of(context).showSnackBar(s);
                setState(() {

                });
              },
              child: Container(
                child: Text(
                  'Submit',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                padding: EdgeInsets.fromLTRB(0, 2, 0, 5),
                decoration: BoxDecoration(),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text("Result: "+ sum.toString()),
            ),
            SizedBox(
              height: 10,
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
                      ),
                    ],
                    onChanged: (String? value) {
                      setState(() {
                        dd = value;
                        SnackBar s = SnackBar(content: Text(dd.toString()));

                        ScaffoldMessenger.of(context).showSnackBar(s);
                      });
                    }),
              ],
            ),

            // ...Dropdwon End.......
          ],
        ),
      ),

    );
  }
}
