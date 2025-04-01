
import 'package:flutter/material.dart';
import 'package:relatorio/enums/letters_char.dart';
import 'package:relatorio/enums/working_hours.dart';

class DatePickerProvider extends ChangeNotifier {
  
  DateTime? selectedDate;

  WorkingHour? shifts = WorkingHour.A;
  LettersChar? selectedValue = LettersChar.A;

  get context => null;

  

  Future<void> selectDate(BuildContext context) async {

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2025, 1, 25),
      firstDate: DateTime(2025),
      lastDate: DateTime(2100),
    );
    if(pickedDate != null){
      selectedDate = pickedDate;
      notifyListeners();
    }
  }

  void setLetterChar(LettersChar? letter){
    selectedValue = letter;
    notifyListeners();
  }

  void setWorkingHour(WorkingHour? workingHour){
    shifts = workingHour;
    notifyListeners();
  }

}
