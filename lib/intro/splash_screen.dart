import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:glucose_control/const.dart';
import 'package:glucose_control/model/enterform_doctor.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 40),
          title: Text(LoginTexts.target)),
      body: const Center(
        child: Image(
          image: AssetImage('assets/images/doctor.jpg'),
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        //You can add more widget bellow
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    //Now we need multiple widgets into a parent = "Container" widget
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(30.0), //Top, Right, Bottom, Left
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: new Text("E Heart",
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 32)),
                ),
                //Need to add space below this Text ?
                new Text(
                  "Explore top organic fruit & grab them",
                  style: new TextStyle(color: Colors.grey[850], fontSize: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    //build function returns a "Widget"
    return new MaterialApp(
        title: "",
        home: new Scaffold(
          appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 40,
              ),
              title: Text(LoginTexts.target)),
          body: new ListView(
            children: <Widget>[
              new Image.asset('assets/images/insulin.jpg', fit: BoxFit.cover),
              //You can add more widget bellow
              titleSection
            ],
          ),
          floatingActionButton: Theme(
            data: Theme.of(context).copyWith(
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                    extendedSizeConstraints:
                        BoxConstraints.tightFor(height: 60, width: 200))),
            child: FloatingActionButton.extended(
              shape: RoundedRectangleBorder(),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScr()));
              },
              backgroundColor: Colors.green,
              label: Text('Next'),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        )); //Widget with "Material design"
  }
}
