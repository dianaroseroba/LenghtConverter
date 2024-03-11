// ignore: unused_import
import 'package:get/get.dart';

enum LengthUnit { meter, centimeter, feet }

class LengthConversionResult {
  final String inputLength;
  final LengthUnit inputUnit;
  final double convertedLength;
  final LengthUnit convertedUnit;

  LengthConversionResult({
    required this.inputLength,
    required this.inputUnit,
    required this.convertedLength,
    required this.convertedUnit,
  });

  @override
  String toString() {
    return '$inputLength ${_unitToString(inputUnit)} = $convertedLength ${_unitToString(convertedUnit)}';
  }

  String _unitToString(LengthUnit unit) {
    switch (unit) {
      case LengthUnit.meter:
        return 'meters';
      case LengthUnit.centimeter:
        return 'centimeters';
      case LengthUnit.feet:
        return 'feet';
      default:
        return '';
    }
  }
}
