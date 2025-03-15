import 'package:flutter/material.dart';

import '../model/vehicle.dart';

class PreventiveVehicle extends StatefulWidget {
  const PreventiveVehicle({super.key});

  @override
  State<PreventiveVehicle> createState() => _PreventiveVehicleState();
}

class _PreventiveVehicleState extends State<PreventiveVehicle> {

  final List<Map<String, TextEditingController>> _controllers = [];
  final List<Vehicle> _vehicles = [];

  _createField() {
    setState(() {
      _controllers.add({
        'title': TextEditingController(),
        'description': TextEditingController(),
      }
      );
    });
  }

  // _removeField(item){
  //   setState(() {
  //
  //     _title.remove(item);
  //     _description.remove(item);
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.all(8.0),
      child: SizedBox(

        height: 400,
        child: Column(

            children: [
              ElevatedButton(
                onPressed: _createField,
                child: const Text('Adicionar Preventiva'),
              ),
              const SizedBox(height: 20),
              Expanded(

                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _controllers.length,
                  itemBuilder: (context, index) {
                    final controllers = _controllers[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: controllers['title'],
                              decoration: const InputDecoration(
                                labelText: 'Título do Veículo',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: controllers['description'],
                              decoration: const InputDecoration(
                                labelText: 'Descrição do Veículo',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
                ,
              )
            ]
        ),
      ),
    );
  }
}

