import 'package:flutter/material.dart';

class Forms extends StatefulWidget{
  const Forms();


  @override
  State<Forms> createState() => _FormsState();
}


class _FormsState extends State<Forms>{

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
                )

              ],
            ),


          )
      );
    }
}



