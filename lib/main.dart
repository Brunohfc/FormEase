import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relatorio/model/providers/accidentsProvider.dart';
import 'package:relatorio/model/providers/preventivaProvider.dart';
import 'package:relatorio/screens/app_bar.dart';


void main() {

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<Accidents>(create: (_) => Accidents()),
    ChangeNotifierProvider<PreventiveVehicle>(create: (_) => PreventiveVehicle())
  ],
    child: MyApp(),
  ) );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MyAppBarWidget();
  }
}



