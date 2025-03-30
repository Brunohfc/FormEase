
import 'package:flutter/material.dart';

class CorrectiveVehicleProvider extends ChangeNotifier {


  final List<Map<String, TextEditingController>> _controllers = [];
  bool _isExpanded = false;

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

}
