import 'package:flutter/material.dart';



class PreventiveVehicleProvider extends ChangeNotifier {

  final List<Map<String, TextEditingController>> controllers = [];
  bool _isExpanded = false;

  createField() {
      controllers.add({
        'title': TextEditingController(),
        'description': TextEditingController(),
      });
      notifyListeners();
  }

  removeField() {
      controllers.removeLast();
      notifyListeners();
  }

  int preventiveLength(){
    return controllers.length;

  }

  isExpanded(){

  }
}
