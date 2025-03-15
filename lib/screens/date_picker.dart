
import 'package:flutter/material.dart';
import 'package:relatorio/enums/letters_char.dart';
import 'package:relatorio/enums/working_hours.dart';

class DatePickerScreen extends StatefulWidget {
  const DatePickerScreen({super.key});

  @override
  State<DatePickerScreen> createState() => _DatePickerScreenState();
}

class _DatePickerScreenState extends State<DatePickerScreen> {
  DateTime? selectedDate;

  late WorkingHour? _shifts = WorkingHour.A;
  late LettersChar? _selectedvalue = LettersChar.A;
  

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2025, 1, 25),
      firstDate: DateTime(2025),
      lastDate: DateTime(2100),
    );
    setState(() {
      selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          selectedDate != null
              ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
              : 'No date selected',
        ),
        OutlinedButton(
            onPressed: _selectDate, child: const Text('Select Date')),

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
                value: _selectedvalue,
                onChanged: (LettersChar? letter) {
                  setState(() {
                    _selectedvalue = letter;
                  });
                },
                items: LettersChar.values.map((LettersChar letter) {
                  return DropdownMenuItem(
                      value: letter, child: Text(letter.name));
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
                  value: _shifts,
                  onChanged: (WorkingHour? shift) {
                    setState(() {
                      _shifts = shift;
                    });
                  },
                  items: WorkingHour.values.map((WorkingHour shift) {
                    return DropdownMenuItem(
                        value: shift, child: Text(shift.value));
                  }).toList()
              ),
            ),
          ],
        ),
      ],
    );
  }
}
