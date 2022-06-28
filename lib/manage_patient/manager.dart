import 'package:flutter/cupertino.dart';
import 'patient.dart';

class Manager {
  static final Manager _singleton = Manager._internal();

  factory Manager() {
    return _singleton;
  }

  Manager._internal();

  List<Patien>? patients = [];

  void addPainet(Patien patien) => patients?.add(patien);

  bool isEmpty(int i) => patients![i] == Null;

  Patien getPainent(int i) => !isEmpty(i) ? patients![i] : patients![0];

  void removePainet(int ID) {
    for (var i = 0; i < patients!.length; i++) {
      if (patients![i].getID == ID) patients!.removeAt(i);
    }
  }

  void setSelect(int i) => patients![i].setSelected();

  List<Patien>? getList() => this.patients;

  void setList(List<Patien> listName) => this.patients = listName;

  void setSelecteDefaut() {
    for (var i = 0; i < this.size(); i++) {
      if (patients![i].selected == true) {
        this.setSelect(i);
        break;
      }
    }
  }

  int size() => patients!.length;
}
