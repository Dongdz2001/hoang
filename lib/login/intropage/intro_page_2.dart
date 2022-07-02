import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:glucose_control/login/intropage/Global.dart';
import 'package:glucose_control/manage_patient/patient.dart';
import 'package:glucose_control/manage_patient/manager.dart';
import 'package:glucose_control/login/intropage/Global.dart';

class IntroPage2 extends StatefulWidget {
  const IntroPage2({Key? key}) : super(key: key);

  @override
  _IntroPage2State createState() => _IntroPage2State();
}

class _IntroPage2State extends State<IntroPage2> {
  String? printOut =
      regiment.getStateCurrentContent(2) + "\n" + "Kiểm tra nồng độ Glucozo:";
  int count = 1;
  bool check_fisnish = true;
  bool check_visual_button = true;
  @override
  Widget build(BuildContext context) {
    TextEditingController _edtcontroller = TextEditingController();

    return Container(
        color: Color.fromARGB(255, 240, 239, 232),
        child: Center(
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      child: Text(
                        printOut.toString(), // regiment.getResult.toString()
                        style: TextStyle(fontSize: 18),
                      ),
                    ),

                    // Kiểm tra nồng độ Glucozo trong 8 lần
                    check_fisnish
                        ? Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 0),
                                child: Text(
                                  'Kiểm tra nồng độ Glucozo lần ${count}: ',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              SizedBox(
                                width: 50,
                                height: 40,
                                child: TextField(
                                  controller: _edtcontroller,
                                  maxLength: 5,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                      counterText: '',
                                      contentPadding:
                                          EdgeInsets.only(bottom: 5, left: 5),
                                      border: OutlineInputBorder(),
                                      errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.red, width: 5))),
                                  onSubmitted: (value) {
                                    setState(() {
                                      print("context: ${value}");
                                      print(
                                          regiment.get_Logic_State_Check_Gluco(
                                              double.parse(value)));
                                      if (count == 1) {
                                        if (regiment.getCurrentIndex_State ==
                                            1) {
                                          regiment.setResult = regiment
                                                  .getStateCurrentContent(2) +
                                              "\n" +
                                              "Kiểm tra nồng độ Glucozo:" +
                                              "\n" +
                                              " - Lần ${count} Glu đạt \"${value} mmol/L \" : ${regiment.get_Logic_State_Check_Gluco(double.parse(value))}";
                                        } else if (regiment
                                                .getCurrentIndex_State ==
                                            2) {
                                          regiment.setResult = regiment
                                                  .getStateCurrentContent(1) +
                                              "\n" +
                                              "Kiểm tra nồng độ Glucozo:" +
                                              "\n" +
                                              " - Lần ${count} Glu đạt \"${value} mmol/L \" : ${regiment.get_Logic_State_Check_Gluco(double.parse(value))}";
                                        } else if (regiment
                                                .getCurrentIndex_State ==
                                            3) {
                                          regiment.setResult = regiment
                                                  .getStateCurrentContent(3) +
                                              "\n" +
                                              "Kiểm tra nồng độ Glucozo:" +
                                              "\n" +
                                              " - Lần ${count} Glu đạt \"${value} mmol/L \" : ${regiment.get_Logic_State_Check_Gluco(double.parse(value))}";
                                        } else if (regiment
                                                .getCurrentIndex_State ==
                                            4) {
                                          regiment.setResult = regiment
                                                  .getStateCurrentContent(4) +
                                              "\n" +
                                              "Kiểm tra nồng độ Glucozo:" +
                                              "\n" +
                                              " - Lần ${count} Glu đạt \"${value} mmol/L \" : ${regiment.get_Logic_State_Check_Gluco(double.parse(value))}";
                                        }
                                      } else {
                                        regiment.setResult = regiment
                                                .getResult +
                                            "\n" +
                                            " - Lần ${count} Glu đat \"${value} mmol/L \" : ${regiment.get_Logic_State_Check_Gluco(double.parse(value))}";
                                      }

                                      printOut = regiment.getResult;
                                      regiment.setPassFailedInjections(
                                          double.parse(value));
                                      if (count != 8) {
                                        if (regiment.getResultFinal()) {
                                          count = 1;
                                          check_fisnish = false;
                                        }
                                        count += 1;
                                      } else {
                                        count = 1;
                                        check_fisnish = false;
                                      }
                                    });
                                  },
                                ),
                              ),
                            ],
                          )
                        : Visibility(
                            visible: check_visual_button,
                            child: ElevatedButton(
                              onPressed: () {
                                print(regiment.getCurrentIndex_State);
                                if (regiment.getResultFinal()) {
                                  setState(() {
                                    printOut =
                                        "Tuyệt quá, bạn xuất viện được rồi";
                                    regiment.set_All_Basic_Default();
                                    regiment.set_CurrentIndex_State_defaut();
                                    check_visual_button = false;
                                  });
                                } else {
                                  if (regiment.getCurrentIndex_State == 1) {
                                    setState(() {
                                      regiment.set_All_Basic_Default();
                                      regiment.up_CurrentIndex_State();
                                      printOut =
                                          regiment.getStateCurrentContent(1);
                                      check_fisnish = true;
                                    });
                                  } else if (regiment.getCurrentIndex_State ==
                                      2) {
                                    setState(() {
                                      regiment.set_All_Basic_Default();
                                      regiment.up_CurrentIndex_State();
                                      printOut =
                                          regiment.getStateCurrentContent(3);
                                      check_fisnish = true;
                                    });
                                  } else if (regiment.getCurrentIndex_State ==
                                      3) {
                                    setState(() {
                                      regiment.set_All_Basic_Default();
                                      regiment.up_CurrentIndex_State();
                                      printOut =
                                          regiment.getStateCurrentContent(4);
                                      check_fisnish = true;
                                    });
                                  } else {
                                    setState(() {
                                      regiment.set_All_Basic_Default();
                                      regiment.up_CurrentIndex_State();
                                      printOut =
                                          "Phác đồ này không khả dụng hãy lựa chọn một phác đồ khác";
                                      check_visual_button = false;
                                    });
                                  }
                                }
                              },
                              child: regiment.getResultFinal()
                                  ? const Text("Thành Công ,Kết thúc phác đồ")
                                  : const Text(
                                      'Thất bại,chuyển phác đồ kế tiếp'),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
