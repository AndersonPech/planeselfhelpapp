import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../globals.dart';

class Calculation {
  Future<void> setAircraftData() async {
    String contents = await rootBundle.loadString('assets/data/aircraft_data.csv');
    //Split the contents of the csv file by new line into a map with Aircraft as the key and the rest of the data as the value
    List lines = contents.split('\n');
    lines.removeAt(0);

    for (final line in lines) {
      List data = line.split(',');
      String aircraft = data[0].trim().toLowerCase();
      Map aircraftData = {
        'Crash': data[1],
        'Denom': data[2],
      };
      aircraftMap[aircraft] = aircraftData;
    }


    // Crash / Denom 
    // n = 1/p
    return;
  }

  Map getAircraftData(String aircraft) {
    Map data = aircraftMap[aircraft];
    int numerator = 0;
    numerator = int.parse(data['Crash']);
    if (numerator == 0) {
      return {'num_flights_until_crash': '0', 'num_crashes': data['Crash'], 'num_flights': data['Denom']};
    }
    double numFlights = 1/(numerator / int.parse(data['Denom']));
    return {'num_flights_until_crash': numFlights.round(), 'num_crashes': data['Crash'], 'num_flights': data['Denom']};
  }

   Map getAirlineData(String aircraft) {
    Map data = airlineMap[aircraft];
    int numerator = 0;
    numerator = int.parse(data['Crash']);
    if (numerator == 0) {
      return {'num_flights_until_crash': '0', 'num_crashes': data['Crash'], 'num_flights': data['Denom']};
    }
    double numFlights = 1/(numerator / int.parse(data['Denom']));
    return {'num_flights_until_crash': numFlights.round(), 'num_crashes': data['Crash'], 'num_flights': data['Denom']};
  }


  Future<void> setAirlineData() async {
    String contents = await rootBundle.loadString('assets/data/airline_data.csv');
    //Split the contents of the csv file by new line into a map with Aircraft as the key and the rest of the data as the value
    List lines = contents.split('\n');
    lines.removeAt(0);

    for (final line in lines) {
      List data = line.split(',');
      String aircraft = data[0].trim().toLowerCase();
      print(data);
      Map airlineData = {
        'Crash': data[1],
        'Denom': data[2],
      };
      airlineMap[aircraft] = airlineData;
    }
    return;
  }
}