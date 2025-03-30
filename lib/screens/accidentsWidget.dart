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
                Text("Qtd Acidentes ${accidents.accidentsCount()}"),
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
                      '+ Acidentes'
                  ),
                ),
                ElevatedButton(

                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(130, 0),
                      backgroundColor: Colors.redAccent,
                    ),
                    onPressed: accidents.removeAccidents , child: Text(
                    style: TextStyle(color: Colors.white),
                    "- Acidentes")
                ),
                // IconButton(
                //     onPressed: (){
                //       accidents.toggleExpansion();
                //     },
                //     icon: Icon(
                //         accidents.toggleExpansion() ? Icons.expand_more : Icons.expand_less
                //     )
                // )
              ],
            ),

            // AnimatedContainer(
            //   duration: const Duration(milliseconds: 500 ),
            //   height: accidents.toggleExpansion() ? 300 : 0,
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
            //                     labelText: 'Título do Acidente',
            //                     border: OutlineInputBorder(),
            //                   ),
            //                 ),
            //                 const SizedBox(height: 10),
            //                 TextFormField(
            //                   controller: controllers['description'],
            //                   decoration: const InputDecoration(
            //                     labelText: 'Descrição do Acidente',
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
