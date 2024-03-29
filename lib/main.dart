import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lenghtunit/controllers/controller.dart';
import 'package:lenghtunit/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const LengthConverterScreen(),
      initialBinding: BindingsBuilder(() {
        Get.put(LengthConverterController());
      }),
    );
  }
}
