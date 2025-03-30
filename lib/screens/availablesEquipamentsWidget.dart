import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/providers/availlableEquipamentsProvider.dart';

class AvailablesEquipamentsWidget extends StatelessWidget {
  const AvailablesEquipamentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AvailablesEquipamentsProvider>(
        builder: (context, availables, child) {
      return Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
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
                    items: numbers.map((int element) {
                      return DropdownMenuItem<int>(
                        value: element,
                        child: Text(element.toString()),
                      );
                    }).toList(),
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
                    items: numbers.map((int element) {
                      return DropdownMenuItem<int>(
                        value: element,
                        child: Text(element.toString()),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
