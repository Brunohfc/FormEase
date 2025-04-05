import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relatorio/model/providers/accidentsProvider.dart';


class AccidentsWidget extends StatelessWidget {
  const AccidentsWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Consumer<AccidentsProvider>(
      builder: (context, accidents, child){
        return Column(
          children: [
            Row(
              children: [
                Text("Qtd Incidentes ${accidents.accidentsCount()}"),
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
                  onPressed: accidents.createAccidents,
                  child: const Text(
                      style:TextStyle(color: Colors.white),
                      '+ Incidentes'
                  ),
                ),
                ElevatedButton(

                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(130, 0),
                      backgroundColor: Colors.redAccent,
                    ),
                    onPressed: accidents.removeAccidents , child: Text(
                    style: TextStyle(color: Colors.white),
                    "- Incidentes")
                ),
                IconButton(
                    onPressed: (){
                      accidents.toggleExpansion();
                    },
                    icon: Icon(
                        accidents.isExpanded ? Icons.expand_more : Icons.expand_less
                    )
                )
              ],
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500 ),
              height: accidents.isExpanded ? 250 : 0,
              child: accidents.isExpanded ? Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: accidents.accidentsCount(),
                      itemBuilder: (context, index) {
                        final controllers = accidents.controllers[index];
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
                                    labelText: 'Relato de Segurança',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  controller: controllers['description'],
                                  decoration: const InputDecoration(
                                    labelText: 'Descrição do Relato de Segurança',
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
              ) : const SizedBox(height: 10,),
            ),
          ],
        );
      }

    );
  }
}
