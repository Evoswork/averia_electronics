import 'package:averia_electronics/injector/injector.dart';
import 'package:averia_electronics/res/theme.dart';
import 'package:averia_electronics/ui/screen/main/main_screen.dart';
import 'package:flutter/material.dart';

class Run extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RunState();
}

class _RunState extends State<Run> {
  final scaffoldKey = getIt<GlobalKey<ScaffoldState>>();
  final navigator = getIt<GlobalKey<NavigatorState>>();
  final rootScaffoldMessengerKey = getIt<GlobalKey<ScaffoldMessengerState>>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: scaffoldKey,
      scaffoldMessengerKey: rootScaffoldMessengerKey,
      navigatorKey: navigator,
      theme: ThemeDataProject.light,
      home: MainScreen(),
    );
  }
}
