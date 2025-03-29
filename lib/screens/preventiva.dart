import 'package:flutter/material.dart';

import '../model/vehicle.dart';

class PreventiveVehicle extends StatefulWidget {
  const PreventiveVehicle({super.key});

  @override
  State<PreventiveVehicle> createState() => _PreventiveVehicleState();
}

class _PreventiveVehicleState extends State<PreventiveVehicle> {

  final List<Map<String, TextEditingController>> _controllers = [];
  bool _isExpanded = false;

  _createField() {
    setState(() {
      _controllers.add({
        'title': TextEditingController(),
        'description': TextEditingController(),
      });
    });
  }

  _removeField() {
    setState(() {
      _controllers.removeLast();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Text("Qtd Preventiva ${_controllers.length}"),
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
                onPressed: _createField,
                child: const Text(
                    style:TextStyle(color: Colors.white),
                    '+ Preventiva'
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(130, 0),
                    backgroundColor: Colors.redAccent,
                  ),
                  onPressed: _removeField, child: Text(
                  style: TextStyle(color: Colors.white),
                  "- Preventiva")
              ),
              IconButton(
                  onPressed: (){
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  icon: Icon(
                      _isExpanded ? Icons.expand_more : Icons.expand_less
                  )
              )
            ],
          ),

          AnimatedContainer(
            duration: const Duration(milliseconds: 500 ),
            height: _isExpanded ? 300 : 0,
            child: _isExpanded ? Expanded(
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
              ),
            ) : const SizedBox(height: 10,),
          ),
        ],
      ),
    );
  }
}
