import 'package:flutter/material.dart';
import 'package:relatorio/screens/preditiva.dart';


import 'date_picker.dart';

class Forms extends StatefulWidget {
  const Forms({super.key});

  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  //final controller = BoardDateTimeController();

  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: EdgeInsets.all(16),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: "Nome do Supervisor"),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Nome do Técnico"),
          ),
          SizedBox(
            height: 5,
          ),
          Container(),
          DatePickerScreen(),
          PreventiveVehicle()
        ],
      ),
    ));
  }
}
