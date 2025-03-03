import 'dart:io';

import 'package:flutter/material.dart';
import '../globals.dart';

class Calculation {
  void setAircraftData() {
    File file = File('lib/data/aircraft_data.csv');
    String contents = file.readAsStringSync();
    //Split the contents of the csv file by new line into a map with Aircraft as the key and the rest of the data as the value
    List lines = contents.split('\n');
    lines.removeAt(0);

    for (final line in lines) {
      List data = line.split(',');
      String aircraft = data[0].trim();
      Map aircraftData = {
        'Crash': data[1],
        'Denom': data[2],
      };
      aircraftMap[aircraft] = aircraftData;
    }

    print('Keys in aircraftMap: ${aircraftMap.keys}');
    print('Data for Boeing 737 Classic: ${aircraftMap['Boeing 737 Classic']}');
    print('Data for McDonnell Douglas MD-90: ${aircraftMap['McDonnell Douglas MD-90']}');


    // Crash / Denom 
    // n = 1/p
    return;
  }

  Map getAircraftData(String aircraft) {
    Map data = aircraftMap[aircraft];
    int numerator = 0;
    if (data['Crash'] == '0') {
      numerator = 3;
    } else {
      numerator = int.parse(data['Crash']);
    }
    double numFlights = 1/(numerator / int.parse(data['Denom']));
    return {'num_flights_until_crash': numFlights.round(), 'num_crashes': data['Crash'], 'num_flights': data['Denom']};
  }

   Map getAirlineData(String aircraft) {
    Map data = airlineMap[aircraft];
    double numFlights = 1/(data['Crash'] / data['Denom']);
    return {'num_flights_until_crash': numFlights, 'num_crashes': data['Crash'], 'num_flights': data['Denom']};
  }


  void setAirlineData() {
    File file = File('lib/data/aircraft_data.csv');
    String contents = file.readAsStringSync();
    //Split the contents of the csv file by new line into a map with Aircraft as the key and the rest of the data as the value
    List lines = contents.split('\n');
    lines.removeAt(0);

    for (final line in lines) {
      List data = line.split(',');
      String aircraft = data[0].trim();
      Map airlineData = {
        'Crash': data[1],
        'Denom': data[2],
      };
      airlineMap[aircraft] = airlineData;
    }
    return;
  }
}