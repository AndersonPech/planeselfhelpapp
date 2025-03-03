// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:planestats/main.dart';
import 'package:planestats/pages/beforeflight.dart';

void main() {
  test('Test if the calculations for airline is right', () {
    Calculation calc = Calculation();
    calc.setAircraftData();
    Map airline = calc.getAircraftData('Airbus A330');
    print(airline);
  });
}
