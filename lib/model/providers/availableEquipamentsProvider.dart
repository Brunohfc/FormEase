import 'package:flutter/material.dart';



class AvailablesEquipamentsProvider extends ChangeNotifier {

  int? availableValueVehicles = 0;
  int? availableValuePipas = 0;

  final List<int> numbers = List.generate(50, (index) => index);

  
  void setavailableVehiclesSelected(int vehicleSelected){
    availableValueVehicles = vehicleSelected;
    notifyListeners();
  }
  
  }
