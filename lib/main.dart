import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _numbController = new TextEditingController();
  String _aprob = "";
  int ok =0;

  void _verif() {
    setState(() {
      for(int i = 0; i<= int.parse(_numbController.text); i++)
      {
        int cube = i*i*i;
        if(cube == double.parse(_numbController.text).toInt())
            ok = 1;
      }
      if((sqrt(double.parse(_numbController.text)).toInt()) == sqrt(double.parse(_numbController.text)) && ok == 1)
        _aprob = "Both";
      else
      if ((sqrt(double.parse(_numbController.text)).toInt()) == sqrt(double.parse(_numbController.text)))
        _aprob = "It's square";
      else
        if(ok==1)
          _aprob = "It's triangle";
          else
            _aprob = "none";
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Center(
            child: Text("Number Shapes"),
          ),
        ),
        body: Form(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Please input a number to see if it is square or triangular',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: false),
                  controller: _numbController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'enter a number'
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: (){
                      _verif();
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                          title: Text(_numbController.text),
                          content: Text('$_aprob'),
                          actions: <Widget>[
                            ElevatedButton(
                                onPressed: () {},
                                child: Text('Ok'),
                            ),
                          ],
                          ),
                      );
                    },
                    child: Text(
                      "Try",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
