import 'package:calcimc/homepage.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     theme: ThemeData(
        primaryColor: Colors.green,
      ),
      title: 'Calcular IMC',
      home: HomePage(),
    );
  }
}