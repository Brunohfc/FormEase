import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relatorio/model/providers/corretiveProvider.dart';

class Corretivewidget extends StatelessWidget {
  const Corretivewidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CorrectiveVehicleProvider>(
      builder: (context, corretive, child) {
        final hasVehicles = corretive.corretiveVehicles.isNotEmpty;

        return Column(
          children: [
            Row(
              children: [
                Text("Qtd Corretiva ${corretive.corretiveCount()}"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(130, 0),
                    backgroundColor: const Color(0xFFE67E22),
                  ),
                  onPressed: corretive.createCorrective,
                  child: const Text(
                    "+ Corretiva",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(130, 0),
                    backgroundColor: Colors.redAccent,
                  ),
                  onPressed: corretive.removeCorrective,
                  child: const Text(
                    "- Corretiva",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                IconButton(
                  onPressed: corretive.toggleIsExpanded,
                  icon: Icon(
                    corretive.isExpanded ? Icons.expand_more : Icons.expand_less,
                  ),
                ),
              ],
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: corretive.isExpanded ? 250 : 0,
              child: corretive.isExpanded
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
                              itemCount: corretive.corretiveCount(),
                              itemBuilder: (context, index) {
                                final entry = corretive.entries[index];
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
                                          items: corretive.corretiveVehicles
                                              .map(
                                                (vehicle) => DropdownMenuItem<String>(
                                                  value: vehicle.codigo,
                                                  child: Text(
                                                    '${vehicle.codigo} - ${vehicle.setor}',
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                          onChanged: (value) =>
                                              corretive.updateVehicleSelection(index, value),
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