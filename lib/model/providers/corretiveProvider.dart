
import 'package:flutter/material.dart';

class CorrectiveVehicleProvider extends ChangeNotifier {


  final List<Map<String, TextEditingController>> _controllers = [];
  bool _isExpanded = false;

  get isExpanded => _isExpanded;
  get controllers => _controllers;
  List<Map<String, TextEditingController>> get corretive => _controllers;

  createCorrective(){
      _controllers.add(
        {
          'title': TextEditingController(),
          'description': TextEditingController()
        }
      );
      notifyListeners();
  }

  removeCorrective(){
      _controllers.removeLast();
      notifyListeners();
  }

  int corretiveCount(){
    return _controllers.length;
  }

  void toggleIsExpanded(){
    _isExpanded = !_isExpanded;
    notifyListeners();
  }
}
