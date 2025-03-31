import 'package:flutter/material.dart';

class EmployessProvider extends ChangeNotifier {

  final supervisorNameController = TextEditingController();
  final technicalNameController = TextEditingController();
  final hintSupervisorName = "Nome do supervisor";
  final hintTechnicalName = "Nome do técnico";
  String supervisorName = '';
  String technicalName = '';
  
  setSupervisorName(String name){
    supervisorName = name;
    notifyListeners();
  }

  setTechnicalName(String name){
    technicalName = name;
    notifyListeners();
  }

}
