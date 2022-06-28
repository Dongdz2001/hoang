import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:glucose_control/form_infor/form_doctor.dart';
import 'package:glucose_control/login/login.dart';
import 'package:glucose_control/manage_patient/patient.dart';
import 'package:glucose_control/path.dart';
import 'package:glucose_control/manage_patient/path.dart';
import '../model/enterform_doctor.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String? myEmail = '';
  int number = -1;
  bool flag_red_green = true;
  int back_steps_select = -1;
  bool flag = false;
  final ScrollController _controller = ScrollController();

  // String? value = "Nuôi dưỡng đường tĩnh mạch";
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  AnimationController? expandController;
  Animation<double>? animation;

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
                      child: InkWell(
                        child: const Text("Profile"),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FormScreen()),
                          );
                          ;
                        },
                      ),
                    ),
                  ]),
        ],
        // Mũi tên quay lại màn hình chính
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => Login()),
                    (Route<dynamic> route) => false);
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        centerTitle: true,
        title: Container(
          width: 45,
          height: 45,
          child: const Icon(Icons.person),
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Colors.white24),
        ),
      ),
      // List hiển thị tên bệnh nhân và phác đồ
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
                                print(isExpanded);
                                flag = false;
                                if (isExpanded) {
                                  manager.setSelect(index);
                                  if (back_steps_select == -1) {
                                    back_steps_select = index;
                                  } else {
                                    manager.setSelect(back_steps_select);
                                    back_steps_select = index;
                                  }
                                  // print("${back_steps_select} -- ${index}}t");
                                } else {
                                  if (back_steps_select == index) {
                                    manager.setSelect(index);
                                    back_steps_select = -1;
                                  }
                                }
                              });
                            },
                            // ảnh của mỗi bệnh nhân
                            leading: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(PathImage.pattien_Image)),
                            trailing: Icon(Icons.alarm_add_rounded),
                            childrenPadding:
                                EdgeInsets.all(16).copyWith(top: 0),
                            title: Text(
                              manager.getPainent(index).getName,
                              // manager.getList()![index].getName,
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w500),
                            ),
                            // Hien thi Phác đồ duoi ten benh nhan
                            subtitle: // Chọn phác đồ
                                Padding(
                              padding: const EdgeInsets.only(right: 40),
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 8),
                                  child: Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.black, width: 1),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        value: manager
                                            .getPainent(index)
                                            .getRegimen,
                                        isExpanded: true,
                                        items:
                                            items.map(buildMenuItem).toList(),
                                        onChanged: (val) => setState(() {
                                          manager.patients![index].setRegimen =
                                              val;
                                        }),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
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
                    itemCount: manager.size(),
                  ),
                ],
              ),
            ),
          ),

          // Thêm bệnh nhân mới
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
                                // Nhap ten benh nhan
                                SizedBox(
                                  width: 260,
                                  height: 50,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: TextField(
                                      autocorrect: false,
                                      enableSuggestions: false,
                                      controller: _nameController,
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

                                // Nhap CMTND = ID
                                SizedBox(
                                  width: 260,
                                  height: 50,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: TextField(
                                      autocorrect: false,
                                      enableSuggestions: false,
                                      controller: _idController,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.only(top: 20),
                                        prefixIcon: Icon(Icons.person),
                                        hintText: "CMND or CCCD ",
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        label: Text("CMND/CCCD"),
                                        labelStyle: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 29, 29, 29),
                                          fontSize: 15,
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
                                    if ((_nameController.text != "") &
                                        (_idController.text.length == 12)) {
                                      setState(() {
                                        number = number + 1;
                                        manager.addPainet(new Patien(
                                            name: _nameController.text,
                                            ID: int.parse(_idController.text),
                                            regimen:
                                                "Nuôi dưỡng đường tĩnh mạch"));
                                      });
                                    }
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

// Lấy ra thông tin email trong firebase
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

// Tạo danh sách lựa chọn phác đồ điều trị
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(
            fontSize: 15,
          ),
          maxLines: 1,
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
