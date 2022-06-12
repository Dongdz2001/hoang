import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ResultScreen extends StatelessWidget {
  final bmiModel;

  ResultScreen({this.bmiModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              SizedBox(
                height: 200,
                width: 200,
                child: bmiModel.isNormal ? SvgPicture.asset("assets/images/happy.svg", fit: BoxFit.contain,) : SvgPicture.asset("assets/images/sad.svg", fit: BoxFit.contain,) ,
              ),

              const SizedBox(
                height: 8,
              ),
              Text("Your Glu is ${bmiModel.bmi.round()}", style: TextStyle(color: Colors.red[700], fontSize: 34, fontWeight: FontWeight.w700),),
              Text("${bmiModel.comments}", style: TextStyle(color: Colors.grey[700], fontSize: 18, fontWeight: FontWeight.w500),),

              const SizedBox(height: 16,),

              bmiModel.isNormal ?
              Text("Hurray! Your Glu is Normal.", style: TextStyle(color: Colors.red[700], fontSize: 18, fontWeight: FontWeight.w700),)
                  :
              Text("Sadly! Your Glu is not Normal.", style: TextStyle(color: Colors.red[700], fontSize: 18, fontWeight: FontWeight.w700),),
              const SizedBox(height: 16,),

              Container(
                child: FlatButton.icon(
                  onPressed: (){

                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white,),
                  label: const Text("LET CALCULATE AGAIN"),
                  textColor: Colors.white,
                  color: Colors.pink,

                ),
                width: double.infinity,
                padding: const EdgeInsets.only(left: 16, right: 16),
              )

            ],
          ),
        )
    );
  }
}