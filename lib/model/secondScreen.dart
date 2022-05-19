import 'package:flutter/material.dart';

import '../const.dart';

class SecondScr extends StatefulWidget {
  @override
  _SecondScrState createState() => _SecondScrState();
}

class _SecondScrState extends State<SecondScr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(top: 20),
          child: ListView(
            children: [
              buildItem(Icon(Icons.file_copy, color: Colors.green),
                  LoginTexts.titleItem1, Icon(Icons.arrow_forward_ios),),
              buildItem(Icon(Icons.fact_check_rounded, color: Colors.green),
                  LoginTexts.titleItem2, Icon(Icons.arrow_forward_ios)),
              buildItem(Icon(Icons.qr_code_2_outlined, color: Colors.green),
                  LoginTexts.titleItem3, Icon(Icons.arrow_forward_ios),),
              buildItem(Icon(Icons.info_rounded, color: Colors.green),
                  LoginTexts.titleItem4, Icon(Icons.arrow_forward_ios))
            ],
          )),
    );
  }
}

Widget buildItem(Icon leadingicon, String title, Icon trailingicon) {
  return Container(
    margin: EdgeInsets.only(left: 20, top: 20, right: 20),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.green, style: BorderStyle.solid),
      borderRadius: BorderRadius.circular(7.0),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: leadingicon,
        trailing: trailingicon,
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        onTap: () {},
      ),
    ),
  );
}
