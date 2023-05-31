import 'package:flutter/material.dart';
import 'package:notead/db/database_servic.dart';
import 'package:notead/models/note.dart';
import 'package:notead/utile/app_route.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox(DatabaseService.boxName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Simple Note',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      routeInformationProvider: AppRoutes.goRoute.routeInformationProvider,
      routeInformationParser: AppRoutes.goRoute.routeInformationParser,
      routerDelegate: AppRoutes.goRoute.routerDelegate,
    );
  }
}
