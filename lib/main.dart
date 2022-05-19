import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:glucose_control/clock_follow/home_page.dart';
import 'package:glucose_control/db/db_helper.dart';
import 'package:glucose_control/intro/splash_screen.dart';
import 'package:glucose_control/login/mainscreen.dart';
import 'package:glucose_control/service/theme_services.dart';
import 'package:glucose_control/ui/theme.dart';
import 'package:get/get.dart';

import 'db/insert.dart';
import 'model/enterform_doctor.dart';
import 'models/Task.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  await GetStorage.init();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      home: MainScreen(),
    );
  }
}
