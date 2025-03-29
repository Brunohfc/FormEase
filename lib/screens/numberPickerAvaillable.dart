import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';


class Availables extends StatefulWidget {
  const Availables({super.key});

  @override
  State<Availables> createState() => _AvailablesState();
}

class _AvailablesState extends State<Availables> {

  int? _availableValueVehicles;
  int? _availableValuePipas;
  final List<int> numbers = List.generate(50, (index) => index);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Row(
          children: [
            Text("Equipamentos aptos"),
            Container(

              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              width: 70,
              height: 50,
              child: DropdownButton<int?>(
                menuWidth: 100,
                value: _availableValueVehicles,
                onChanged: (int? newValue) {
                  setState(() {
                    _availableValueVehicles = newValue;
                  });
                },
                items: numbers.map((int element){
                  return DropdownMenuItem<int>(

                  value: element,
                  child: Text(element.toString()),
                  );
                  }
                  ).toList(),
              ),
            ),
            Text("Pipas aptos"),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              width: 70,
              height: 50,
              child: DropdownButton<int?>(
                menuWidth: 100,
                value: _availableValuePipas,
                onChanged: (int? newValue) {
                  setState(() {
                    _availableValuePipas ??= 0;
                    _availableValuePipas = newValue;

                  });
                },
                items: numbers.map((int element){
                  return DropdownMenuItem<int>(

                    value: element,
                    child: Text(element.toString()),
                  );
                }
                ).toList(),
              ),
            ),
          ],

        ),

      ],
    );
    }
  }
