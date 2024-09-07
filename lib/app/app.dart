import 'package:advanced_course/presentation/resources/routes_manager.dart';
import 'package:advanced_course/presentation/resources/theme_manager.dart';
import 'package:flutter/material.dart';
class MyApp extends StatefulWidget {
  //const MyApp({super.key});//default constructor --> I omitted this in order to make a problem and make compiler confused with the 2 constructors .
  MyApp._internal(); //named constructor (private)

  int appState=0;
  static final MyApp instance= MyApp._internal();
  @override
  _MyAppState createState() => _MyAppState();
  factory MyApp() => instance;
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.splashRoute,
      theme:getApplicationTheme(),
    );
  }
}
