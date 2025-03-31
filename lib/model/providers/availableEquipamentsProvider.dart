import 'package:flutter/material.dart';



class AvailablesEquipamentsProvider extends ChangeNotifier {

  int? availableValueVehicles;
  int? availableValuePipas;

  final List<int> numbers = List.generate(50, (index) => index);

  
  void setavailableVehiclesSelected(int vehicleSelected){
    availableValueVehicles = vehicleSelected;
    notifyListeners();
  }
  
  void setavailablePipasSelected(int pipasSelected){
    availableValuePipas = pipasSelected;
    notifyListeners();
  }
  }
