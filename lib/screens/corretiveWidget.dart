import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relatorio/model/providers/corretiveProvider.dart';

class Corretivewidget extends StatelessWidget {
  const Corretivewidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CorrectiveVehicleProvider>(
        builder: (context, corretive, child) {
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
                          fixedSize: Size(130, 0),
                          backgroundColor: Colors.green
                      ),
                      onPressed: corretive.createCorrective,
                      child: const Text("+ Corretiva",
                        style: TextStyle(color: Colors.white),
                      )
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(130, 0),
                          backgroundColor: Colors.redAccent
                      ),
                      onPressed: corretive.removeCorrective,
                      child: const Text("- Corretiva",
                        style: TextStyle(color: Colors.white),
                      )
                  ),
                  // IconButton(
                  //     onPressed: () {
                  //         _isExpanded = !_isExpanded;
                  //
                  //     },
                  //     icon: Icon(
                  //         _isExpanded ? Icons.expand_more : Icons.expand_less
                  //     )
                  // )

                ],
              ),
              // AnimatedContainer(
              //   duration: const Duration(milliseconds: 500),
              //   height: _isExpanded ? 300 : 0,
              //   child: _isExpanded ? Expanded(
              //     child: ListView.builder(
              //       shrinkWrap: true,
              //       itemCount: _controllers.length,
              //       itemBuilder: (context, index) {
              //         final controllers = _controllers[index];
              //         return Card(
              //           margin: const EdgeInsets.symmetric(vertical: 8.0),
              //           child: Padding(
              //             padding: const EdgeInsets.all(16.0),
              //             child: Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 TextFormField(
              //                   controller: controllers['title'],
              //                   decoration: const InputDecoration(
              //                     labelText: 'Título do Veículo',
              //                     border: OutlineInputBorder(),
              //                   ),
              //                 ),
              //                 const SizedBox(height: 10),
              //                 TextFormField(
              //                   controller: controllers['description'],
              //                   decoration: const InputDecoration(
              //                     labelText: 'Descrição do Veículo',
              //                     border: OutlineInputBorder(),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         );
              //       },
              //     ),
              //   ) : const SizedBox(height: 10,),
              // ),
            ],
          );
        }
        );
    }
}

