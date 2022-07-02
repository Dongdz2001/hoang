import 'package:flutter/material.dart';
import '';

class Regimen_NDDTM {
  String? result = "None";

  Regimen_NDDTM();

  // get set for result
  get getResult => this.result;
  set setResult(String result) => this.result = result;

  int current_Index_State = 1;

  // get set for current_Index_State
  get getCurrentIndex_State => this.current_Index_State;
  void up_CurrentIndex_State() => this.current_Index_State += 1;
  void set_CurrentIndex_State_defaut() => this.current_Index_State = 1;

  double? current_Gluco = 0;

  // get set for current_Glucozo
  get getCurrentGluco => this.current_Gluco;
  set setCurrentGluco(double value) => this.current_Gluco = value;

  int regiment_check_glucozo_state = -1;

  get getRegimentcheck_glucozo_state => this.regiment_check_glucozo_state;

  set setRegimentcheck_glucozo_state(int value) =>
      this.regiment_check_glucozo_state = value;

  List<List<int>> listStateLogic = [];
  var listbool_Injections = [-1, -1, -1, -1, -1, -1, -1, -1];

  int getStateCurrent(int x, int y) => this.listStateLogic[x][y];
  List<String> listContext = [];

// Các trạng thái của phác đồ
  final String _state_1 = """ 
  -	Tiêm dưới da insulin tác dụng chậm
  + Liều khởi đầu: 0.2 UI/kg/ngày 
  + Loại Insulin: Lantus
  + Thời điểm tiêm: 22h
  -	 Truyền glucose 10% 500ml pha truyền 10UI Actrapid (3 chai/ngày, 6h – 12h – 22h, 100ml/h)
  """;
  final String _state_2 = """  
  -	Tạm ngừng các thuốc hạ đường máu
  -	Truyền glucose 10% 500ml pha truyền 10UI Actrapid ( 3 chai /ngày, 6h – 12h – 22h, 100 m/h) 
  """;
  final String _state_3 = """  
  - Tăng liều Lantus lên 2 UI
  """;
  final String _state_4 = """  
  - Truyền insulin bơm tiêm điện
  """;

  // Kiểm tra nồng độ Glucozo và in ra kết quả
  String get_Logic_State_Check_Gluco(double gluco) {
    if ((3.9 <= gluco) && (gluco <= 8.3)) {
      return "Đạt mục tiêu";
    } else if ((8.3 < gluco) && (gluco <= 11.1)) {
      return "Chưa đạt,cần TTD Actrapid 2UI";
    } else if (gluco > 11.1) {
      return "Chưa đạt,cần TDD Actrapid 4UI";
    }
    return "Chưa đạt mục tiêu";
  }

  //In ra phác đồ theo lựa chọn
  String getStateCurrentContent(int state) {
    switch (state) {
      case 1:
        return _state_1;
        break;
      case 2:
        return _state_2;
        break;
      case 3:
        return _state_3;
        break;
      case 4:
        return _state_4;
        break;
      default:
        return "Error !";
        break;
    }
  }

  //  thiết lập giá trị cho mỗi lần tiêm: -1 = chưa tiêm, 0 = không đạt , 1 = đạt
  void setPassFailedInjections(double value) {
    for (var i = 0; i < listbool_Injections.length; i++) {
      if (listbool_Injections[i] == -1) {
        if ((3.9 <= value) && (value <= 8.3)) {
          this.listbool_Injections[i] = 1;
        } else {
          listbool_Injections[i] = 0;
        }
        break;
      }
    }
  }

  // In ra số lần đã tiêm
  int getNumberofInjections() {
    int count = 0;
    for (var i = 0; i < listbool_Injections.length; i++) {
      if (listbool_Injections[i] != -1) {
        count += 1;
      }
    }
    return count;
  }

  // thiết lập lại mảng chưa tiêm gồm toàn -1
  void set_Default_Listbool_Injections() {
    listbool_Injections = [-1, -1, -1, -1, -1, -1, -1, -1];
  }

  // thiết lập tất cả về trạng thái ban đầu;
  void set_All_Basic_Default() {
    listbool_Injections = [-1, -1, -1, -1, -1, -1, -1, -1];
    current_Gluco = 0;
    result = "Tuyệt quá, không có gì cả!";
  }

  // Kiểm tra xem kết quả cuối cùng có đạt hay không
  bool getResultFinal() {
    int count = 0;
    for (var i = 0; i < listbool_Injections.length; i++) {
      if (listbool_Injections[i] == 1) {
        count += 1;
      }
    }
    if (count >= 4) {
      return true;
    } else {
      return false;
    }
  }
}
