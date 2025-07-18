import 'package:flutter/material.dart';

class AccidentsProvider extends ChangeNotifier {

  final List<Map<String, TextEditingController>> controllers = [];
  bool isExpanded = false;
  bool isDisableButtonState = true;

  List<Map<String,TextEditingController>> get accidents => controllers;
  createAccidents() {
    controllers.add({
      'title': TextEditingController(),
      'description': TextEditingController()
    });
    notifyListeners();
  }

  removeAccidents() {
    controllers.removeLast();
    notifyListeners();

  }

  void toggleExpansion() {
    isExpanded = !isExpanded;
    notifyListeners();

  }

  int accidentsCount() {
    return controllers.length;
  }

}
