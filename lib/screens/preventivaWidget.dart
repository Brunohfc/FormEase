import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/providers/preventivaProvider.dart';

class PreventiveWidget extends StatelessWidget {
  const PreventiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Consumer<PreventiveVehicleProvider>(
        builder: (context, preventive, child){
          return Column(
            children: [
              Row(
                children: [
                  Text("Qtd Preventiva ${preventive.preventiveLength()}"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(130, 0),
                      backgroundColor: Colors.green,
                    ),
                    onPressed: preventive.createField,
                    child: const Text(
                        style: TextStyle(color: Colors.white), '+ Preventiva'),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(130, 0),
                        backgroundColor: Colors.redAccent,
                      ),
                      onPressed: preventive.removeField,
                      child: Text(
                          style: TextStyle(color: Colors.white), "- Preventiva")),
                  IconButton(
                      onPressed: () {
                          preventive.toggleIsExpanded();
                      },
                      icon:
                      Icon(preventive.isExpanded ? Icons.expand_more : Icons.expand_less)
                  )
                ],
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                height: preventive.isExpanded ? 250 : 0,
                child: preventive.isExpanded
                    ? Column(
                      children: [
                        Expanded(
                            child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: preventive.preventiveLength(),
                        itemBuilder: (context, index) {
                          final controllers = preventive.controllers[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    controller: controllers['title'],
                                    decoration: const InputDecoration(
                                      labelText: 'Equipamento',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  TextFormField(
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    controller: controllers['description'],
                                    decoration: const InputDecoration(
                                      labelText: 'Descrição do Equipamento',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                                          ),
                                        ),
                      ],
                    )
                    : const SizedBox(
                  height: 10,
                ),
              ),
            ],
          );
        }
      );

  }
}
