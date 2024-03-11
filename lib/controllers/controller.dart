import 'package:get/get.dart';

enum LengthUnit { meter, centimeter, feet }

class LengthConverterController extends GetxController {
  var inputLength = ''.obs;
  var selectedInputUnit = LengthUnit.meter.obs;
  var selectedConvertedUnit = LengthUnit.meter.obs;
  var convertedLength = ''.obs;

  void convertLength() {
    if (inputLength.value.isEmpty) {
      convertedLength.value = '';
      return;
    }

    double input = double.tryParse(inputLength.value) ?? 0;
    double result;

    // Convertir la longitud de la unidad de entrada a la unidad de salida
    switch (selectedInputUnit.value) {
      case LengthUnit.meter:
        result = _convertFromMeter(input, selectedConvertedUnit.value);
        break;
      case LengthUnit.centimeter:
        result = _convertFromCentimeter(input, selectedConvertedUnit.value);
        break;
      case LengthUnit.feet:
        result = _convertFromFeet(input, selectedConvertedUnit.value);
        break;
    }

    convertedLength.value = result.toString();
  }

  // Funciones para realizar las conversiones específicas
  double _convertFromMeter(double length, LengthUnit unit) {
    switch (unit) {
      case LengthUnit.meter:
        return length;
      case LengthUnit.centimeter:
        return length * 100;
      case LengthUnit.feet:
        return length / 0.3048;
      default:
        return 0;
    }
  }

  double _convertFromCentimeter(double length, LengthUnit unit) {
    switch (unit) {
      case LengthUnit.meter:
        return length / 100;
      case LengthUnit.centimeter:
        return length;
      case LengthUnit.feet:
        return length / (0.3048 * 100);
      default:
        return 0;
    }
  }

  double _convertFromFeet(double length, LengthUnit unit) {
    switch (unit) {
      case LengthUnit.meter:
        return length * 0.3048;
      case LengthUnit.centimeter:
        return length * (0.3048 * 100);
      case LengthUnit.feet:
        return length;
      default:
        return 0;
    }
  }
}
