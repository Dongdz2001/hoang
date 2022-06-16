// import 'package:listview2/manager.dart';
import 'manager.dart';
import 'patient.dart';

String blueF = 'assests/blueflowwer.jpg';
String yellowF = 'assests/hoahong.jpg';
String pinkF = 'assests/yellowflower.jpg';
var listpath = [blueF, yellowF, pinkF];

// Manager painent
Patien painent1 = new Patien(name: "dong", ID: 20, treatmentregimen: "Tri");
Patien painent2 = new Patien(name: "hoang", ID: 21);
Patien painent3 =
    new Patien(name: "hai", ID: 22, treatmentregimen: "Liet Chan");
Patien painent4 = new Patien(name: "long", ID: 23);
Patien painent5 = new Patien(name: "linh", ID: 25, treatmentregimen: "ngao co");

final items = [
  'Nuôi dưỡng đường tĩnh mạch',
  'Nuôi cấy tế bào gốc',
  'Điều trị đau vai gáy'
];

List<Patien> mana = [
  painent1,
  painent2,
  painent3,
  painent4,
  painent5,
  painent1,
  painent2,
  painent3,
  painent4,
  painent5,
  painent1,
  painent2,
  painent3,
  painent4,
  painent5
];
Manager manager = Manager();
