import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glucose_control/login/login_intro.dart';
import 'package:glucose_control/verify/phone_home.dart';
import 'signup.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:glucose_control/global.dart';
import 'dart:io';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _passwordVisible = true;
  bool flag_login = false;

  @override
  Widget build(BuildContext context) {
    if (user_current != '') _email.text = user_current;
    _password.text = password_current;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color.fromARGB(255, 23, 198, 99),
                Color.fromARGB(255, 57, 195, 213)
              ])),
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
            child: Stack(
              children: [
                Visibility(
                  visible: flag_login,
                  child: FittedBox(
                    child: Container(
                      width: 50,
                      height: 50,
                      margin: const EdgeInsets.symmetric(
                          vertical: 280, horizontal: 170),
                      child: const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Color.fromARGB(255, 255, 255, 255))),
                    ),
                  ),
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 50, 10, 20),
                        child: Container(
                          width: 50,
                          height: 50,
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 219, 228, 226),
                          ),
                          child: FittedBox(
                              child:
                                  Image.asset('assets/images/icon_doctor.png')),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Text(
                          "Hello \n Wellcome Come Back!",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: TextField(
                          controller: _email,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.email_outlined),
                            hintText: 'enter your email',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(22.0)),
                            labelText: "User Name",
                            labelStyle: const TextStyle(
                              color: Color.fromARGB(255, 29, 29, 29),
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                        child: Stack(
                          alignment: AlignmentDirectional.centerEnd,
                          children: [
                            TextField(
                              controller: _password,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              obscureText: _passwordVisible,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock_outline),
                                hintText: 'enter your password',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(22.0)),
                                labelText: "Password",
                                labelStyle: const TextStyle(
                                  color: Color.fromARGB(255, 30, 30, 30),
                                  fontSize: 15,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Theme.of(context).primaryColorDark,
                                  ),
                                  onPressed: () {
                                    // Update the state i.e. toogle the state of passwordVisible variable
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                      password_current = _password.text;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 1, 112, 203),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              _checkLoginFirebase();
                            });
                          },
                          child: const Text(
                            "Sign in",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            InkWell(
                              child: Row(
                                children: const <Widget>[
                                  Icon(Icons.app_registration_outlined),
                                  Text(
                                    "Sign up ?",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 28, 27, 27),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const SignUp()));
                              },
                            ),
                            InkWell(
                              child: Row(
                                children: const <Widget>[
                                  Icon(Icons.lock_open_outlined),
                                  Text(
                                    "forgot password ?",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 3, 42, 75),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginSc()),
                                );
                                // );
                              },
                            ),
                          ],
                        ),
                      ),
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

// Th??ng b??o sai khi nh???p d??? li???u
  void _showToast(String content, int time) {
    Fluttertoast.showToast(
        msg: content,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: time,
        backgroundColor: const Color.fromARGB(255, 82, 146, 242),
        textColor: Colors.white,
        fontSize: 16.0);
  }

// Ki???m tra login firebase
  void _checkLoginFirebase() async {
    password_current = _password.text;
    user_current = _email.text;
    flag_login = !flag_login;
    sleep(const Duration(seconds: 1));
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: _email.text, password: _password.text)
        .then(
          (user) => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Home()),
              (route) => false),
        )
        .catchError((e) {
      _password.text = '';
      password_current = '';
      print("ERRORS: $e");
      if (flag_login) flag_login = !flag_login;
      setState(() {
        _showToast('Email or password is invalidated', 1);
      });
    });
  }
}
