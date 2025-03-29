import 'package:flutter/material.dart';
import 'package:relatorio/screens/accidentsWidget.dart';
import 'package:relatorio/screens/preventivaWidget.dart';

import 'forms.dart';

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
        body: ListView(
          children: [
            AccidentsWidget(),
            PreventiveWidget()
          ],
        ),
      ),
    );
  }
}
