import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../service/user.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _email=TextEditingController();
  final TextEditingController _password=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Sign Up Form'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email_outlined),
                hintText: 'Enter your email',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22.0)),
              ),
              onChanged: (value) => setState(() {
                _email.text = value;
              }),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_outline),
                  hintText: 'Enter password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22.0))),
              onChanged: (value) => setState(() {
                _password.text = value;
              }),
            ),
            const SizedBox(
              height: 150,
            ),
            FlatButton(
                padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 72),
                color: Colors.deepPurple,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                onPressed: () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                      email: _email.text, password: _password.text)
                      .then((signedInUser) {
                    UserManagement().storeNewUser(signedInUser.user, context);
                  }).catchError((e) {
                    print(e);
                  });
                },
                child: const Text(
                  'SIGN UP',
                  style: TextStyle(fontSize: 18.0),
                )),
          ],
        ),
      ),
    );
  }
}