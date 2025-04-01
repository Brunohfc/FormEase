import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/providers/availableEquipamentsProvider.dart';

class AvailablesEquipamentsWidget extends StatelessWidget {
  const AvailablesEquipamentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AvailablesEquipamentsProvider>(
        builder: (context, availables, child) {
      return Column(
        children: [
          Row(
            children: [
              Text("Equipamentos aptos"),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                width: 70,
                height: 50,
                child: DropdownButton<int>(

                  menuWidth: 100,
                  value: context.watch<AvailablesEquipamentsProvider>().availableValueVehicles,
                  onChanged: (int? newValue) {
                      if(newValue != null){
                        context.read<AvailablesEquipamentsProvider>().setavailableVehiclesSelected(newValue);
                      }
                      context.read<AvailablesEquipamentsProvider>().availableValueVehicles = 0;
                  },
                  items: availables.numbers.map((int element) {
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
                  value: context.watch<AvailablesEquipamentsProvider>().availableValuePipas,
                  onChanged: (int? newValue) {
                    if(newValue != null){
                      context.read<AvailablesEquipamentsProvider>().setavailablePipasSelected(newValue);
                    }
                  },
                  items: availables.numbers.map((int element) {
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
      );
    });
  }
}
