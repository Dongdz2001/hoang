import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glucose_control/login/login_intro.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Login Form'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _email,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                hintText: 'Your Email',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22.0)),
              ),
              onChanged: (value) => () {
                _email.text = value;
              },
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: _password,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline),
                  hintText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22.0))),
              onChanged: (value) => () {
                _password.text = value;
              },
            ),
            SizedBox(
              height: 150,
            ),
            FlatButton(
                padding: EdgeInsets.symmetric(vertical: 18, horizontal: 72),
                color: Colors.deepPurple,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(32.0)),
                onPressed: () async {
                  await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _email.text, password: _password.text)
                      .then((user) => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                          (route) => false))
                      .catchError((e) {
                    print("ERROR: ${e}");
                  });
                },
                child: Text(
                  'LOGIN',
                  style: TextStyle(fontSize: 18.0),
                )),
          ],
        ),
      ),
    );
  }
}
