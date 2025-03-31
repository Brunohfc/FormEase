import 'package:flutter/material.dart';



class PreventiveVehicleProvider extends ChangeNotifier {

  final List<Map<String, TextEditingController>> _controllers = [];
  bool _isExpanded = false;

  get isExpanded => _isExpanded;
  get controllers => _controllers;
  List<Map<String, TextEditingController>> get preventiveVehicle => _controllers;

  createField() {
      _controllers.add({
        'title': TextEditingController(),
        'description': TextEditingController(),
      });
      notifyListeners();
  }

  removeField() {
      _controllers.removeLast();
      notifyListeners();
  }

  int preventiveLength(){
    return _controllers.length;

  }

  void toggleIsExpanded(){
    _isExpanded = !_isExpanded;
    notifyListeners();
  }
}
