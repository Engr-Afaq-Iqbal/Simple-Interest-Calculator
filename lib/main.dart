import 'package:flutter/material.dart';
import 'package:si_calculator/screens/main_code.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SIApp(),
    theme: ThemeData(
      primaryColor: Colors.indigo,
      accentColor: Colors.indigoAccent,
    ),
  ));
}
