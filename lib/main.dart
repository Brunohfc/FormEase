import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relatorio/model/entities/corrective.dart';
import 'package:relatorio/model/entities/preventive.dart';
import 'package:relatorio/model/entities/seed/preventive_seed.dart';
import 'package:relatorio/model/entities/seed/corrective_seed.dart';
import 'package:relatorio/model/providers/EmployeesProvider.dart';
import 'package:relatorio/model/providers/accidentsProvider.dart';
import 'package:relatorio/model/providers/availableEquipamentsProvider.dart';
import 'package:relatorio/model/providers/correctiveProvider.dart';
import 'package:relatorio/model/providers/preventivaProvider.dart';
import 'package:relatorio/screens/app_bar.dart';
import 'model/providers/datePickerProvider.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(PreventiveAdapter());
  Hive.registerAdapter(CorretiveAdapter());

  final preventiveBox = await Hive.openBox<Preventive>('preventives');
  await seedPreventive(preventiveBox);
  final corretiveBox = await Hive.openBox<Corretive>('corretives');
  await seedCorretive(corretiveBox);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AccidentsProvider>(create: (_) => AccidentsProvider()),
        ChangeNotifierProvider<PreventiveVehicleProvider>(create: (_) => PreventiveVehicleProvider(preventiveBox)),
        ChangeNotifierProvider<CorrectiveVehicleProvider>(create: (_) => CorrectiveVehicleProvider(corretiveBox)),
        ChangeNotifierProvider(create: (_) => DatePickerProvider()),
        ChangeNotifierProvider(create: (_) => AvailablesEquipamentsProvider()),
        ChangeNotifierProvider(create: (_) => EmployessProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppBarWidget();
  }
}