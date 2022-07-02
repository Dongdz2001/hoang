import 'package:flutter/cupertino.dart';

class Patien {
  String? name = 'None';
  String? old;
  String? address;
  String? regimen;
  int? ID;
  int? check_pass;
  bool selected = false;
  var treatment_regimen = -1;

  // get set for treatment_regimen;
  get getTreatment_regimen => this.treatment_regimen;
  set setTreatment_regimen(var treatment_regimen) =>
      this.treatment_regimen = treatment_regimen;

  //get sert for
  get getRegimen => this.regimen;
  set setRegimen(regimen) => this.regimen = regimen;

  void setSelected() => this.selected = !this.selected;

  get getSelected => this.selected;
  // Contructor getter and setter
  get getName => this.name;

  set _setName(name) => this.name = name;

  get getOld => this.old;

  set _setOld(old) => this.old = old;

  get getAddress => this.address;

  set _setAddress(address) => this.address = address;

  get getID => this.ID;

  set _setID(ID) => this.ID = ID;

  // Contructor patien
  Patien(
      {required this.name,
      this.old,
      this.address,
      @required this.ID,
      @required this.regimen});
}
