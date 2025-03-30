import 'package:flutter/material.dart';

class AccidentsProvider extends ChangeNotifier {

  final List<Map<String, TextEditingController>> _controllers = [];
  bool _isExpanded = false;
  bool isDisableButtonState = true;


  createAccidents() {

    _controllers.add({
      'title': TextEditingController(),
      'description': TextEditingController()
    });
    notifyListeners();
  }

  removeAccidents() {

    _controllers.removeLast();
    notifyListeners();

  }

  void toggleExpansion() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }

  int accidentsCount() {
    return _controllers.length;
  }

}
