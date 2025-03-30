import 'package:flutter/material.dart';
import 'package:relatorio/screens/accidentsWidget.dart';
import 'package:relatorio/screens/availablesEquipamentsWidget.dart';
import 'package:relatorio/screens/corretiveWidget.dart';
import 'package:relatorio/screens/datePickerWidget.dart';
import 'package:relatorio/screens/employeesWidget.dart';
import 'package:relatorio/screens/preventivaWidget.dart';

import '../model/providers/datePickerProvider.dart';
import '../model/providers/EmployeesProvider.dart';

class MyAppBarWidget extends StatefulWidget {
  const MyAppBarWidget({super.key});

  @override
  State<MyAppBarWidget> createState() => _MyAppBarWidgetState();
}

class _MyAppBarWidgetState extends State<MyAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(52, 35, 156, 109),
          //#347F7A
          title: Row(
            children: <Widget>[
              SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset("assets/images/vale.png")),
              Center(child: Text("Criar Relatório"))
            ],
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Employeeswidget(),
              DatePickerWidget(),
              PreventiveWidget(),
              Corretivewidget(),
              AccidentsWidget(),
              AvailablesEquipamentsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
