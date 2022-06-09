import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:glucose_control/login/login.dart';
import 'package:glucose_control/path.dart';
import '../form_infor/form_doctor.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String? myEmail = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 98, 57, 169),
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.menu),
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text("Profile"),
                      onTap: () {
                        print("OKOKOOK**********");
                      },
                    ),
                  ]),
        ],
        leading: Icon(Icons.arrow_back),
        centerTitle: true,
        title: Container(
          width: 45,
          height: 45,
          child: Icon(Icons.person),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.white24),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Stack(
              children: [
                // Center(
                //   child: FutureBuilder(
                //     future: _fetch(),
                //     builder: (context, snapshot) {
                //       if (snapshot.connectionState != ConnectionState.done) {
                //         return const Text("Loading data...Please wait");
                //       }
                //       return Column(
                //         children: [],
                //       );
                // },
                // ),
                // ),
                Container(
                  margin: EdgeInsets.only(top: 500, left: 320),
                  alignment: Alignment.bottomLeft,
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 188, 191, 193),
                  ),
                  child: InkWell(
                      child: Image.asset(PathImage.plus_Image),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FormScreen()));
                      }),
                ),
              ],
            ),
            ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                Card(
                    child: ListTile(
                        title: Text("Battery Full"),
                        subtitle: Text("The battery is full."),
                        leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
                        trailing: Icon(Icons.star))),
                Card(
                    child: ListTile(
                        title: Text("Anchor"),
                        subtitle: Text("Lower the anchor."),
                        leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg")),
                        trailing: Icon(Icons.star))),
                Card(
                    child: ListTile(
                        title: Text("Alarm"),
                        subtitle: Text("This is the time."),
                        leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg")),
                        trailing: Icon(Icons.star))),
                Card(
                    child: ListTile(
                        title: Text("Ballot"),
                        subtitle: Text("Cast your vote."),
                        leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg")),
                        trailing: Icon(Icons.star)))
              ],
            ),
          ],
        ),
      ),
    );
  }

  _fetch() async {
    final firebaseUser = FirebaseAuth.instance.currentUser!;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser.uid)
        .get()
        .then((ds) {
      myEmail = ds.data()!['email'].toString();
      print('***********************${myEmail}*************');
    }).catchError((e) {
      print(e);
    });
  }
}
