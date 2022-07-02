import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class IntroPage1 extends StatelessWidget {
  final PageController controller;
  const IntroPage1({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Container(
        color: Color.fromARGB(255, 250, 242, 245),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Tiêm Insulin',
                style: TextStyle(fontSize: 25),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),

                // element toggle
                child: ToggleSwitch(
                  minWidth: 65.0,
                  initialLabelIndex: 2,
                  cornerRadius: 20.0,
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  totalSwitches: 2,
                  labels: ['No', 'Yes'],
                  //Icons.backspace_rounded, Icons.add_task_rounded
                  icons: [Icons.backspace_rounded, Icons.add_task_rounded],
                  activeBgColors: [
                    [Colors.pink],
                    [Colors.green]
                  ],
                  onToggle: (index) async {
                    print('switched to: $index');

                    await Future.delayed(const Duration(milliseconds: 200), () {
                      if (index == 0) {
                        controller.jumpToPage(1);
                      } else {
                        controller.jumpToPage(2);
                      }
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
