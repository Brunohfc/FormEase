import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relatorio/model/providers/EmployeesProvider.dart';

class Employeeswidget extends StatelessWidget {
  const Employeeswidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<EmployessProvider>(
      builder: (context, employees, child){
        return SizedBox(
          width: 100,
          height: 200,
          child: Form(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(helperText: employees.hintSupervisorName),
                  controller: employees.supervisorNameController,
                  onChanged: (value) => employees.setSupervisorName(value),
                ),
                Text(employees.supervisorName),

                TextFormField(
                  decoration: InputDecoration(helperText: employees.hintTechnicalName),
                  controller: employees.technicalNameController,
                  onChanged: (value) => employees.setTechnicalName(value),
                ),
                Text(employees.technicalName)
              ],
            ),
          ),
        );
      }
    );




  }
}

