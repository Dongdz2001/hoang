import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:glucose_control/login/login.dart';
import 'package:glucose_control/path.dart';
import '../form_infor/form_doctor.dart';
import 'package:glucose_control/manage_patient/manager.dart';
import 'package:glucose_control/manage_patient/path.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String? myEmail = '';
  int number = 0;
  bool flag_red_green = true;
  int back_steps_select = -1;
  @override
  Widget build(BuildContext context) {
    manager.setList(mana);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 98, 57, 169),
        actions: [
          PopupMenuButton(
              icon: const Icon(Icons.menu),
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: const Text("Profile"),
                      onTap: () {
                        print("OKOKOOK**********");
                      },
                    ),
                  ]),
        ],
        leading: const Icon(Icons.arrow_back),
        centerTitle: true,
        title: Container(
          width: 45,
          height: 45,
          child: const Icon(Icons.person),
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Colors.white24),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    if (manager.size() != number) number = number + 1;
                  });
                },
                child: Text("Add ListTile"),
              ),
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    if (back_steps_select != -1) manager.setSelecteDefaut();
                    back_steps_select = -1;
                    number = 0;
                  });
                },
                child: Text("Delete ListTile"),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        physics: ScrollPhysics(parent: null),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Container(
                          // color: Colors.orange,
                          padding: EdgeInsets.only(bottom: 5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25.0),
                            child: Card(
                              elevation: 5,
                              shape: Border(
                                  right: BorderSide(
                                      color:
                                          manager.getList()![index].getSelected
                                              ? Colors.red
                                              : Colors.green,
                                      width: 5)),
                              color: Colors.white,
                              shadowColor: Colors.blueAccent,
                              child: ExpansionTile(
                                onExpansionChanged: (bool isExpanded) {
                                  setState(() {
                                    if (isExpanded) {
                                      if (back_steps_select == -1) {
                                        back_steps_select = index;
                                      } else {
                                        manager.setSelect(back_steps_select);

                                        back_steps_select = index;
                                      }
                                      manager.setSelect(index);
                                    }
                                  });
                                },
                                leading: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        "https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
                                trailing: Icon(Icons.alarm_add_rounded),
                                childrenPadding:
                                    EdgeInsets.all(16).copyWith(top: 0),
                                title: Text(
                                  manager.getPainent(index).getName,
                                  // manager.getList()![index].getName,
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500),
                                ),
                                subtitle: Text("Nuôi dưỡng đường tĩnh mạch"),
                                children: [
                                  Text(
                                    'My name is Sarah and I am a New York City based Flutter developer. I help entrepreneurs & businesses figure out how to build scalable applications.\n\nWith over 7 years experience spanning across many industries from B2B to B2C, I live and breath Flutter.',
                                    style: TextStyle(fontSize: 18, height: 1.4),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        itemCount: number,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 80,
            right: 40,
            child: Container(
              margin: const EdgeInsets.only(top: 500, left: 32),
              alignment: Alignment.center,
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 188, 191, 193),
              ),
              child: InkWell(
                child: Image.asset(PathImage.plus_Image),
                onTap: () {
                  setState(() {
                    new Container(
                      color: Colors.amberAccent[500],
                      child: SizedBox(
                        width: 100,
                        height: 100,
                      ),
                    );
                  });
                },
              ),
            ),
          ),
        ],
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


// Container(
          //   width: double.infinity,
          //   child: ListView(
          //     padding: const EdgeInsets.all(8),
          //     children: const <Widget>[
          //       Card(
          //           child: ListTile(
          //               title: Text("Ballot"),
          //               subtitle: Text("Cast your vote."),
          //               leading: CircleAvatar(
          //                   backgroundImage: NetworkImage(
          //                       "https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg")),
          //               trailing: Icon(Icons.star)))
          //     ],
          //   ),
          // ),