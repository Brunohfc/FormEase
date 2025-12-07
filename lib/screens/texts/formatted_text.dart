import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:relatorio/model/providers/EmployeesProvider.dart';
import 'package:relatorio/model/providers/accidentsProvider.dart';
import 'package:relatorio/model/providers/availableEquipamentsProvider.dart';
import 'package:relatorio/model/providers/corretiveProvider.dart';
import 'package:relatorio/model/providers/datePickerProvider.dart';
import 'package:relatorio/model/providers/preventivaProvider.dart';

class FormattedTextWidget extends StatelessWidget {
  const FormattedTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final accidentsProvider = context.watch<AccidentsProvider>();
    final availablesEquipamentsProvider = context.watch<AvailablesEquipamentsProvider>();
    final corretiveProvider = context.watch<CorrectiveVehicleProvider>();
    final datePickerProvider = context.watch<DatePickerProvider>();
    final employeeProvider = context.watch<EmployessProvider>();
    final preventivaProvider = context.watch<PreventiveVehicleProvider>();
    String preventives = "";
    String corretives = "";
    String accidents = "";

    for (final entry in preventivaProvider.entries) {
      final selectedCode = entry.selectedCode;
      final description = entry.descriptionController.text;
      String title = "Não selecionado";
      if (selectedCode != null) {
        for (final vehicle in preventivaProvider.preventiveVehicles) {
          if (vehicle.codigo == selectedCode) {
            title = "${vehicle.codigo} - ${vehicle.setor}";
            break;
          }
        }
      }
      preventives += "\n\t🔵 Título: $title\n\t🔵 Descrição: $description\n";
    }

    for (var item in corretiveProvider.corretive) {
      String title = item['title']?.text ?? "";
      String description = item['description']?.text ?? "";
      corretives += "\n\t🟠 Título: $title\n\t🟠 Descrição: $description\n";
    }

    for (var item in accidentsProvider.accidents) {
      String title = item['title']?.text ?? "";
      String desciption = item['description']?.text ?? "";
      accidents += "\n\t🔴 Título: $title\n\t🔴 Descrição: $desciption\n";
    }

    String report = """ 
    RELATÓRIO FINAL DE TURNO
    ----------------------------------------------------
    Data: ${datePickerProvider.selectedDate != null ? "${datePickerProvider.selectedDate!.day}/${datePickerProvider.selectedDate!.month}/${datePickerProvider.selectedDate!.year}" : "Não selecionada"}
    Supervisor: ${employeeProvider.supervisorName}
    Técnico: ${employeeProvider.technicalName}
    Turma: ${datePickerProvider.selectedValue?.name}
    Turno: ${datePickerProvider.shifts?.value}
    ----------------------------------------------------
    Equipamentos
    🟢 Equipamentos aptos: ${availablesEquipamentsProvider.availableValueVehicles}
    🟢 Pipas aptos: ${availablesEquipamentsProvider.availableValuePipas}
    🔵 Preventiva: ${preventivaProvider.preventiveLength()}
    🟠 Corretiva: ${corretiveProvider.corretiveCount()}
    🔴 Acidentes: ${accidentsProvider.accidentsCount()}
    ----------------------------------------------------
    Detalhes
    🔵Equipamentos em Prenvetiva:
    ${preventives.isNotEmpty ? preventives : "🔵 Nenhuma Preventiva\n"}
      ----------------------------------------------------
    🟠 Corretivas
    ${corretives.isNotEmpty ? corretives : "🟠 Nenhuma Corretiva\n"}
    ----------------------------------------------------
    🔴Acidentes
    ${accidents.isNotEmpty ? accidents : "🔴 Nenhum acidente\n"}
  
    ----------------------------------------------------
    """;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Resumo do Relatório"),
        backgroundColor: Color.fromARGB(52, 35, 156, 109),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Container(
            height: 650,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    report,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: report));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Relatório copiado para área de transferência")),
                      );
                    },
                    child: Text("Copiar relatório"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Voltar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}