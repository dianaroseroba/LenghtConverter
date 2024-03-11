import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lenghtunit/controllers/controller.dart';

class LengthConverterScreen extends StatelessWidget {
  const LengthConverterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Length Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Enter Length'),
              onChanged: (value) {
                Get.find<LengthConverterController>().inputLength.value = value;
              },
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<LengthUnit>(
              value: LengthUnit.meter,
              items: const [
                DropdownMenuItem(
                  value: LengthUnit.meter,
                  child: Text('Meter'),
                ),
                DropdownMenuItem(
                  value: LengthUnit.centimeter,
                  child: Text('Centimeter'),
                ),
                DropdownMenuItem(
                  value: LengthUnit.feet,
                  child: Text('Feet'),
                ),
              ],
              onChanged: (value) {
                Get.find<LengthConverterController>().selectedInputUnit.value = value!;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.find<LengthConverterController>().convertLength();
              },
              child: const Text('Convert'),
            ),
            const SizedBox(height: 20),
            GetX<LengthConverterController>(
              builder: (controller) {
                return Text(
                  'Converted Length: ${controller.convertedLength}',
                  style: const TextStyle(fontSize: 18),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
