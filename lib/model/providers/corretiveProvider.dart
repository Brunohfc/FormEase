import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../entities/corretive.dart';

class CorrectiveFormEntry {
  CorrectiveFormEntry({this.selectedCode, required this.descriptionController});

  String? selectedCode;
  final TextEditingController descriptionController;
}

class CorrectiveVehicleProvider extends ChangeNotifier {
  CorrectiveVehicleProvider(this._corretiveBox) {
    _loadCorrectiveVehicles();
  }

  final Box<Corretive> _corretiveBox;
  final List<CorrectiveFormEntry> _entries = [];
  final List<Corretive> _availableVehicles = [];
  bool _isExpanded = false;

  bool get isExpanded => _isExpanded;
  int corretiveCount() => _entries.length;
  List<CorrectiveFormEntry> get entries => List.unmodifiable(_entries);
  List<Corretive> get corretiveVehicles => List.unmodifiable(_availableVehicles);

  void _loadCorrectiveVehicles() {
    _availableVehicles
      ..clear()
      ..addAll(_corretiveBox.values);
    notifyListeners();
  }

  void createCorrective() {
    _entries.add(
      CorrectiveFormEntry(
        descriptionController: TextEditingController(),
      ),
    );
    notifyListeners();
  }

  void removeCorrective() {
    if (_entries.isEmpty) return;
    _entries.removeLast();
    notifyListeners();
  }

  void updateVehicleSelection(int index, String? code) {
    if (index < 0 || index >= _entries.length) return;
    _entries[index].selectedCode = code;
    notifyListeners();
  }

  void toggleIsExpanded() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }
}