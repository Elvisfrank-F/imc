import 'package:flutter/material.dart';
import 'package:imc/controllers/imc_controller.dart';
import 'package:imc/views/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

   // final controller = ImcController();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage()
    );
  }
}

