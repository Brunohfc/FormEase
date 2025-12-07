import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../entities/preventive.dart';

// Cada entrada representa uma linha do formulário (veículo selecionado + descrição)
class PreventiveFormEntry {
  PreventiveFormEntry({this.selectedCode, required this.descriptionController});

  String? selectedCode;
  final TextEditingController descriptionController;
}

class PreventiveVehicleProvider extends ChangeNotifier {
  PreventiveVehicleProvider(this._preventiveBox) {
    _loadPreventiveVehicles(); // Carrega os veículos persistidos assim que o provider nasce
  }

  final Box<Preventive> _preventiveBox;
  final List<PreventiveFormEntry> _entries = [];
  final List<Preventive> _availableVehicles = [];
  bool _isExpanded = false;

  bool get isExpanded => _isExpanded;
  int preventiveLength() => _entries.length;
  List<PreventiveFormEntry> get entries => List.unmodifiable(_entries);
  List<Preventive> get preventiveVehicles => List.unmodifiable(_availableVehicles);

  void _loadPreventiveVehicles() {
    _availableVehicles
      ..clear()
      ..addAll(_preventiveBox.values); // Mantém a lista suspensa sincronizada com o Hive
    notifyListeners();
  }

  void createField() {
    _entries.add(
      PreventiveFormEntry(
        descriptionController: TextEditingController(),
      ),
    ); // Adiciona uma nova linha com dropdown e descrição
    notifyListeners();
  }

  void removeField() {
    if (_entries.isEmpty) return;
    _entries.removeLast();
    notifyListeners();
  }

  void updateVehicleSelection(int index, String? code) {
    if (index < 0 || index >= _entries.length) return;
    _entries[index].selectedCode = code; // Guarda o código escolhido pelo usuário
    notifyListeners();
  }

  void toggleIsExpanded() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }
}