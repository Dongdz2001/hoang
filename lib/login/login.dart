import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glucose_control/login/login_intro.dart';
import 'signup.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
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
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 57, 195, 213)
              ])),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(left: 10, right: 10, top: 50),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 50, 10, 20),
                    child: Container(
                      width: 70,
                      height: 70,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 219, 228, 226),
                      ),
                      child: Image.asset('assets/images/icon_doctor.png'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
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
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        hintText: 'enter your email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22.0)),
                        labelText: "User Name",
                        labelStyle: TextStyle(
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
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          obscureText: _passwordVisible,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline),
                            hintText: 'enter your password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(22.0)),
                            labelText: "Password",
                            labelStyle: TextStyle(
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
                        primary: Color.fromARGB(255, 1, 112, 203),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: _checkLoginFirebase,
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                          child: Row(
                            children: <Widget>[
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
                                    builder: (context) => SignUp()));
                          },
                        ),
                        InkWell(
                          child: Row(
                            children: <Widget>[
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
                            _showToast('Nothing', 1);
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   SnackBar(
                            //     behavior: SnackBarBehavior.floating,
                            //     margin: EdgeInsets.only(bottom: 100.0),
                            //     content: Text("Incremented"),
                            //     duration: Duration(milliseconds: 300),
                            //   ),
                            // );
                          },
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  void _showToast(String content, int time) {
    Fluttertoast.showToast(
        msg: content,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: time,
        backgroundColor: Color.fromARGB(255, 82, 146, 242),
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void _checkLoginFirebase() async {
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
      _showToast('Email or password is invalidated', 1);
      _password.text = '';
      print("hhoo");
      print("ERRORS: ${e}");
    });
  }
}
