import 'package:flutter/material.dart';
import 'package:relatorio/model/providers/accidentsProvider.dart';
import 'package:relatorio/screens/corretiva.dart';
import 'package:relatorio/model/providers/preventivaProvider.dart';

import 'date_picker.dart';
import 'formatted_text.dart';
import 'numberPickerAvaillable.dart';

class Forms extends StatefulWidget {
  const Forms({super.key});

  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {



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
          CorrectiveVehicle(),
          Availables(),
          SizedBox(height: 20,),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FormattedTextWidget()),
                );
              },
              child: Text("Gerar Relatório"))
        ],
      ),

    )
    );
  }
}
