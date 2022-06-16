import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:glucose_control/login/login.dart';
import 'package:glucose_control/manage_patient/patient.dart';
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
  bool flag = false;
  final ScrollController _controller = ScrollController();
  String? value = "Nuôi dưỡng đường tĩnh mạch";
  final TextEditingController _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AnimationController controller;
    Animation<Offset> offset;

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            // height: MediaQuery.of(context).size.height - 250,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListView.builder(
                    controller: _controller,
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
                                  color: manager.getList()![index].getSelected
                                      ? Colors.red
                                      : Colors.green,
                                  width: 5)),
                          color: Colors.white,
                          shadowColor: Colors.blueAccent,
                          child: ExpansionTile(
                            onExpansionChanged: (bool isExpanded) {
                              setState(() {
                                flag = false;
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
                                  fontSize: 24, fontWeight: FontWeight.w500),
                            ),
                            subtitle: Text(
                                manager.getPainent(index).getTreatmentregimen),
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
          Container(
            height: 110,
            child: DraggableScrollableSheet(
              initialChildSize: 0.1,
              minChildSize: 0.1,
              maxChildSize: 1,
              builder: (context, scrollController) => SingleChildScrollView(
                controller: scrollController,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromARGB(255, 1, 254, 9), width: 2)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        color: Color.fromARGB(255, 238, 247, 235),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  width: 260,
                                  height: 50,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: TextField(
                                      autocorrect: false,
                                      enableSuggestions: false,
                                      controller: _name,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.only(top: 20),
                                        prefixIcon: Icon(Icons.person),
                                        hintText: "Name of Paiteint",
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        label: Text("Name"),
                                        labelStyle: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 29, 29, 29),
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 260,
                                  height: 50,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.black, width: 1),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          value: value,
                                          isExpanded: true,
                                          items:
                                              items.map(buildMenuItem).toList(),
                                          onChanged: (value) => setState(() {
                                            this.value = value;
                                            print(this.value);
                                          }),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      // if (manager.size() != number)
                                      number = number + 1;
                                      if (_name.text != null) {
                                        manager.addPainet(new Patien(
                                            name: _name.text,
                                            ID: 25,
                                            treatmentregimen: this.value));
                                      }
                                    });
                                  },
                                  child: Text("Add Patient"),
                                ),
                                Container(
                                  child: OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        if (back_steps_select != -1)
                                          manager.setSelecteDefaut();
                                        back_steps_select = -1;
                                        number = 0;
                                        manager.setList([]);
                                      });
                                    },
                                    child: Text("Delete ListTile"),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(),
        ),
      );
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