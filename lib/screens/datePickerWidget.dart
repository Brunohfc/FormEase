import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relatorio/model/providers/datePickerProvider.dart';

import '../enums/letters_char.dart';
import '../enums/working_hours.dart';

class DatePickerWidget extends StatelessWidget {
  const DatePickerWidget({super.key});


  @override
  Widget build(BuildContext context) {

    late WorkingHour? shifts = WorkingHour.A;
    late LettersChar? selectedValue = LettersChar.A;

    return Consumer<DatePickerProvider>(

      builder: (context, datePicker, child){
        return Column(
          children: [
            Text(
              datePicker.selectedDate != null
                  ? '${datePicker.selectedDate!.day}/${datePicker.selectedDate!.month}/${datePicker.selectedDate!.year}'
                  : 'No date selected',
            ),
            OutlinedButton(
                onPressed: () => datePicker.selectDate(context), child: const Text('Select Date')
            ),

            Row(
              children: [
                Text("Turma"),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  width: 60,
                  height: 50,
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      color: Colors.amber, borderRadius: BorderRadius.circular(10)),
                  child: DropdownButton<LettersChar>(
                    value: context.watch<DatePickerProvider>().selectedValue,
                    onChanged: (LettersChar? letter) {
                        context.read<DatePickerProvider>().setLetterChar(letter);
                    },
                    items: LettersChar.values.map((LettersChar letter) {
                      return DropdownMenuItem<LettersChar>(
                          value: letter,
                          child: Text(letter.name));
                    }).toList(),
                  ),
                ),
                Spacer(),
                Text("Horário"),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  height: 50,
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      color: Colors.amber, borderRadius: BorderRadius.circular(10)),
                  child: DropdownButton<WorkingHour>(
                      value: context.watch<DatePickerProvider>().shifts,
                      onChanged: (WorkingHour? shift) {
                          context.read<DatePickerProvider>().setWorkingHour(shift);
                      },
                      items: WorkingHour.values.map((WorkingHour shift) {
                        return DropdownMenuItem<WorkingHour>(
                            value: shift,
                            child: Text(shift.value)
                        );
                      }).toList()
                  ),
                ),
              ],
            ),
          ],
        );
      }
    );

  }
}
