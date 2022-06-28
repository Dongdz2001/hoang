import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'GluModel.dart';
import 'ResultScreen.dart';

class BMICalculatorScreen extends StatefulWidget {
  const BMICalculatorScreen({Key? key}) : super(key: key);

  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  double _gluOfUser_6 = 0.0;
  double _gluOfUser_12 = 0.0;
  double _gluOfUser_18 = 0.0;
  double _gluOfUser_22 = 0.0;
  double _gluOfUser_6_1 = 0.0;
  double _gluOfUser_12_1 = 0.0;
  double _gluOfUser_18_1 = 0.0;
  double _gluOfUser_22_1 = 0.0;
  double _bmi = 0;

  late BMIModel _bmiModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 200,
                width: 200,
                child: SvgPicture.asset(
                  "assets/images/heart.svg",
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "GLU Calculator",
                style: TextStyle(
                    color: Colors.red[700],
                    fontSize: 34,
                    fontWeight: FontWeight.w700),
              ),
              const Text(
                "We care about your health",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                "DAY 1",
                style: TextStyle(
                    color: Colors.red[700],
                    fontSize: 45,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Glucose (mmol) _ 6h",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 24,
                    fontWeight: FontWeight.w400),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Slider(
                  min: 0.0,
                  max: 30.0,
                  onChanged: (height) {
                    setState(() {
                      _gluOfUser_6 = height;
                    });
                  },
                  value: _gluOfUser_6,
                  divisions: 900,
                  activeColor: Colors.pink,
                  label: "$_gluOfUser_6",
                ),
              ),
              Text(
                "$_gluOfUser_6 mmol",
                style: const TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Glucose (mmol) _ 12h",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 24,
                    fontWeight: FontWeight.w400),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Slider(
                  min: 0.0,
                  max: 30.0,
                  onChanged: (height) {
                    setState(() {
                      _gluOfUser_12 = height;
                    });
                  },
                  value: _gluOfUser_12,
                  divisions: 900,
                  activeColor: Colors.pink,
                  label: "$_gluOfUser_12",
                ),
              ),
              Text(
                "$_gluOfUser_12 mmol",
                style: const TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Glucose (mmol) _ 18h",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 24,
                    fontWeight: FontWeight.w400),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Slider(
                  min: 0.0,
                  max: 30.0,
                  onChanged: (height) {
                    setState(() {
                      _gluOfUser_18 = height;
                    });
                  },
                  value: _gluOfUser_18,
                  divisions: 900,
                  activeColor: Colors.pink,
                  label: "$_gluOfUser_18",
                ),
              ),
              Text(
                "$_gluOfUser_18 mmol",
                style: const TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Glucose (mmol) _ 22h",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 24,
                    fontWeight: FontWeight.w400),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Slider(
                  min: 0.0,
                  max: 30.0,
                  onChanged: (height) {
                    setState(() {
                      _gluOfUser_22 = height;
                    });
                  },
                  value: _gluOfUser_22,
                  divisions: 900,
                  activeColor: Colors.pink,
                  label: "$_gluOfUser_22",
                ),
              ),
              Text(
                "$_gluOfUser_22 mmol",
                style: const TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.w900),
              ),
              Text(
                "DAY 2",
                style: TextStyle(
                    color: Colors.red[700],
                    fontSize: 45,
                    fontWeight: FontWeight.w400),
              ),
              const Text(
                "Glucose (mmol) _ 6h",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 24,
                    fontWeight: FontWeight.w400),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Slider(
                  min: 0.0,
                  max: 30.0,
                  onChanged: (height) {
                    setState(() {
                      _gluOfUser_6_1 = height;
                    });
                  },
                  value: _gluOfUser_6_1,
                  divisions: 900,
                  activeColor: Colors.pink,
                  label: "$_gluOfUser_6_1",
                ),
              ),
              Text(
                "$_gluOfUser_6_1 mmol",
                style: const TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Glucose (mmol) _ 12h",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 24,
                    fontWeight: FontWeight.w400),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Slider(
                  min: 0.0,
                  max: 30.0,
                  onChanged: (height) {
                    setState(() {
                      _gluOfUser_12_1 = height;
                    });
                  },
                  value: _gluOfUser_12_1,
                  divisions: 900,
                  activeColor: Colors.pink,
                  label: "$_gluOfUser_12_1",
                ),
              ),
              Text(
                "$_gluOfUser_12_1 mmol",
                style: const TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Glucose (mmol) _ 18h",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 24,
                    fontWeight: FontWeight.w400),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Slider(
                  min: 0.0,
                  max: 30.0,
                  onChanged: (height) {
                    setState(() {
                      _gluOfUser_18_1 = height;
                    });
                  },
                  value: _gluOfUser_18_1,
                  divisions: 900,
                  activeColor: Colors.pink,
                  label: "$_gluOfUser_18_1",
                ),
              ),
              Text(
                "$_gluOfUser_18_1 mmol",
                style: const TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Glucose (mmol) _ 22h",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 24,
                    fontWeight: FontWeight.w400),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Slider(
                  min: 0.0,
                  max: 30.0,
                  onChanged: (height) {
                    setState(() {
                      _gluOfUser_22_1 = height;
                    });
                  },
                  value: _gluOfUser_22_1,
                  divisions: 900,
                  activeColor: Colors.pink,
                  label: "$_gluOfUser_22_1",
                ),
              ),
              Text(
                "$_gluOfUser_22_1 mmol",
                style: const TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.w900),
              ),
              Container(
                child: FlatButton.icon(
                  onPressed: () {
                    setState(() {
                      var list = [
                        _gluOfUser_6,
                        _gluOfUser_12,
                        _gluOfUser_18,
                        _gluOfUser_22,
                        _gluOfUser_6_1,
                        _gluOfUser_12_1,
                        _gluOfUser_18_1,
                        _gluOfUser_22_1
                      ];
                      var list1=[];
                      for(var item in list){
                        if(item >= 3.9 && item <= 8.3){
                          list1.add(item);
                        }
                      }
                      int _bmi= list1.length;

                      if (_bmi >= 4) {
                        _bmiModel = BMIModel(
                            bmi: _bmi,
                            isNormal: true,
                            comments: "Bệnh nhân khỏi bệnh, kết thúc phác đồ");
                      } else {
                        _bmiModel = BMIModel(
                            bmi: _bmi,
                            isNormal: false,
                            comments: "Đến lộ trình tiếp theo");
                      }
                    });

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultScreen(
                                  bmiModel: _bmiModel,
                                )));
                  },
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  label: const Text("CALCULATE"),
                  textColor: Colors.white,
                  color: Colors.pink,
                ),
                width: double.infinity,
                padding: const EdgeInsets.only(left: 16, right: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
