import 'package:flutter/material.dart';
import 'views/home_page.dart';

void main() {
  runApp(AgriculturalControlApp());
}

class AgriculturalControlApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Controle Agrícola',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
