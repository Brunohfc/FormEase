import 'package:flutter/material.dart';
import 'package:relatorio/model/providers/accidentsProvider.dart';
import 'package:relatorio/model/providers/corretiveProvider.dart';
import 'package:relatorio/model/providers/preventivaProvider.dart';

import 'datePickerProvider.dart';
import '../../screens/formatted_text.dart';
import 'availableEquipamentsProvider.dart';

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
