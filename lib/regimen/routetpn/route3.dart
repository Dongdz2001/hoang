import 'package:flutter/material.dart';
import 'package:glucose_control/clock_follow/home_page.dart';

import '../../const.dart';

class Route3 extends StatefulWidget {
  const Route3({Key? key}) : super(key: key);

  @override
  _Route3State createState() => _Route3State();
}

class _Route3State extends State<Route3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: const EdgeInsets.only(top: 20),
          child: Builder(builder: (context) {
            return ListView(
              children: [
                buildItem(
                  const Icon(Icons.file_copy, color: Colors.green),
                  LoginTexts.titleItem11,
                  const Icon(Icons.add_task),
                ),
                buildItem(const Icon(Icons.file_copy, color: Colors.green),
                    LoginTexts.titleItem12, const Icon(Icons.add_task)),
                Container(
                  margin: const EdgeInsets.only(left: 80, top: 20, right: 80),
                  child: RaisedButton(
                    child: const Text(
                      'Next',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const HomePage()));

                      //Send to API
                    },
                  ),
                )
                // Expanded(child: child)
              ],
            );
          }),
        ));
  }
}

Widget buildItem(Icon leadingicon, String title, Icon trailingicon) {
  return Container(
    margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
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
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        onTap: () {},
      ),
    ),
  );
}
