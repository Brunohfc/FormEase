import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/providers/preventivaProvider.dart';

class PreventiveWidget extends StatelessWidget {
  const PreventiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PreventiveVehicleProvider>(
      builder: (context, preventive, child) {
        final hasVehicles = preventive.preventiveVehicles.isNotEmpty;

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
                    fixedSize: const Size(130, 0),
                    backgroundColor: const Color(0xFF3CB5E6),
                  ),
                  onPressed: preventive.createField,
                  child: const Text(
                    '+ Preventiva',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(130, 0),
                    backgroundColor: Colors.redAccent,
                  ),
                  onPressed: preventive.removeField,
                  child: const Text(
                    "- Preventiva",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                IconButton(
                  onPressed: preventive.toggleIsExpanded,
                  icon: Icon(
                    preventive.isExpanded ? Icons.expand_more : Icons.expand_less,
                  ),
                )
              ],
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: preventive.isExpanded ? 250 : 0,
              child: preventive.isExpanded
                  ? Column(
                      children: [
                        if (!hasVehicles)
                          const Expanded(
                            child: Center(
                              child: Text('Nenhum veículo cadastrado.'),
                            ),
                          )
                        else
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: preventive.preventiveLength(),
                              itemBuilder: (context, index) {
                                final entry = preventive.entries[index];
                                return Card(
                                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        DropdownButtonFormField<String>(
                                          value: entry.selectedCode,
                                          decoration: const InputDecoration(
                                            labelText: 'Equipamento',
                                            border: OutlineInputBorder(),
                                          ),
                                          items: preventive.preventiveVehicles
                                              .map(
                                                (vehicle) => DropdownMenuItem<String>(
                                                  value: vehicle.codigo,
                                                  child: Text(
                                                    '${vehicle.codigo} - ${vehicle.setor}',
                                                  ),
                                                ),
                                              )
                                              .toList(), // Opções carregadas do banco local (Hive)
                                          onChanged: (value) =>
                                              preventive.updateVehicleSelection(index, value),
                                        ),
                                        const SizedBox(height: 10),
                                        TextFormField(
                                          keyboardType: TextInputType.multiline,
                                          maxLines: null,
                                          controller: entry.descriptionController,
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
                  : const SizedBox(height: 10),
            ),
          ],
        );
      },
    );
  }
}